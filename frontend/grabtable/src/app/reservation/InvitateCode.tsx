import { Button } from '@/components/ui/button'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { useToast } from '@/components/ui/use-toast'
import { FaRegClipboard } from 'react-icons/fa'

interface InviteCodeProps {
  inviteCode: string
}

export default function InviteCode({ inviteCode }: InviteCodeProps) {
  const { toast } = useToast()

  const copyToClipboard = () => {
    navigator.clipboard.writeText(inviteCode)
    toast({
      description: 'Successfully copied invitation code!',
    })
  }

  return (
    <div className="flex items-end mb-4">
      <div className="grid w-full gap-1.5 mr-4">
        <Label htmlFor="invitecode">
          Invite people using this invitation code!
        </Label>
        <Textarea value={inviteCode} rows={1} id="invitecode" readOnly />
      </div>
      <Button
        onClick={copyToClipboard}
        className="bg-black hover:bg-black/70 dark:bg-white"
      >
        <FaRegClipboard /> Copy
      </Button>
    </div>
  )
}
