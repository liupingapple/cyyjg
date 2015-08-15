import java.security.MessageDigest
import javax.xml.bind.annotation.adapters.HexBinaryAdapter
class SHACodec {
	static encode = {target->
		MessageDigest md = MessageDigest.getInstance('SHA')
		md.update(target.getBytes('UTF-8'))
		return new String(md.digest()).encodeAsBase64()
	}
}
