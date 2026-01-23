Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAjFFOdcc2l3vAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 12:35:03 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A967751C8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 12:35:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=erS8OkCcsDtScFhd+UuqdBySyPL7zwxqqPUDRlD0/nk=; b=FpnKYnkDuj3INNpJH7E6u7XLcB
	c22rgW2JM0vzwhjsgXxrI3UOSvQFaszsYH1Wg3r5w5U0KMo6BJkE8b/dIF1KRC6n4/Uv2W1jSK9Qp
	YgbKsgHQW5T6JSRznBKKnO6bVc327gHljbP+YHE95Sfsm58S2XfB0kkccfEu7HjL+jxY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vjCiw-0006RF-OR;
	Fri, 23 Jan 2026 08:40:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quickbooks@notification.intuit.com>)
 id 1vjCij-0006Jj-3O for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 08:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ce9/ic0m6ZCCqIafJfd5CfijDZQkfEx9vbtac+DC1Oc=; b=lLUGo7briqfxmJalFBlxtmkJXM
 PzbzJRB4BRAe1QX6pRfXOPSlVbEoe5cSulByebO95fuBX18TJ3uxlFiQ9wodKVPMT6ezH0nYqcfDE
 miPHlnNFbq4lXbtmq0qFLq5KAxhW6z5qbJeNsb/CvqV1UO+ii58G0TqlKYcxuiqvUs74=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ce9/ic0m6ZCCqIafJfd5CfijDZQkfEx9vbtac+DC1Oc=; b=M
 +en1yvGvUHPO5btAw+4V2S+OCNM3K75+U8fQJ1TJ2UBb8g1p59oqVOITpFjhymyxGfXvtN4v5bQQt
 8pqE4qu4S1ITd/GFk70s73IYZiR/bmngyeUQEpSsI8uJZeGrwRRe0GtbsVhNwhZimNaiQ8AbXq20s
 g6ZaEAlS9YfvtNes=;
Received: from [194.62.167.100] by sfi-mx-2.v28.lw.sourceforge.com with esmtp 
 (Exim 4.95) id 1vjCii-0006bh-0H
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 08:40:45 +0000
To: linux-f2fs-devel@lists.sourceforge.net
Date: 23 Jan 2026 00:40:33 -0800
Message-ID: <20260123004033.921D76F22BD56FF0@notification.intuit.com>
MIME-Version: 1.0
X-Spam-Score: 3.9 (+++)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  linux-f2fs-devel@lists.sourceforge.net 様 平素より lists.sourceforge.net
    のサービスをご利用いただき、誠にありがとうございます。
    このたび、セキュリティの維持およびお客様情報保護の一環として、
    お客様のアカウント（linux-f2fs- devel@lists.sourceforge.net）について定期的な確認を�
    [...] 
 
 Content analysis details:   (3.9 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  2.5 URIBL_PH_SURBL         Contains an URL listed in the PH SURBL blocklist
                             [URI: marumomodipadi.co.za]
  0.1 MXG_EMAIL_FRAG         BODY: URI with email in fragment
  1.3 RDNS_NONE              Delivered to internal network by a host with no rDNS
  0.0 GB_CUSTOM_HTM_URI      Custom html uri
  0.0 TO_NO_BRKTS_FROM_MSSP  Multiple header formatting problems
  0.0 FROM_MISSPACED         From: missing whitespace
X-Headers-End: 1vjCii-0006bh-0H
Subject: [f2fs-dev] =?utf-8?b?44Ki44Kr44Km44Oz44OI5oOF5aCx44GU56K66KqN44Gu?=
 =?utf-8?b?44GK6aGY44GE77yI6YeN6KaB77yJ?=
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: "lists.sourceforge.net via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "lists.sourceforge.net" <quickbooks@notification.intuit.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	URIBL_BLACK(7.50)[marumomodipadi.co.za:url];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	PH_SURBL_MULTI(5.00)[marumomodipadi.co.za:url];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_EQ_FROM(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[quickbooks@notification.intuit.com];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	TO_DN_NONE(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:216.105.38.7];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[notification.intuit.com:mid,notification.intuit.com:replyto,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,marumomodipadi.co.za:url]
X-Rspamd-Queue-Id: 4A967751C8
X-Rspamd-Action: no action

bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQg5qeYCgrlubPntKDjgojjgoog
bGlzdHMuc291cmNlZm9yZ2UubmV0IOOBruOCteODvOODk+OCueOCkuOBlOWIqeeUqOOBhOOBn+OB
oOOBjeOAgeiqoOOBq+OBguOCiuOBjOOBqOOBhuOBlOOBluOBhOOBvuOBmeOAggoK44GT44Gu44Gf
44Gz44CB44K744Kt44Ol44Oq44OG44Kj44Gu57at5oyB44GK44KI44Gz44GK5a6i5qeY5oOF5aCx
5L+d6K2344Gu5LiA55Kw44Go44GX44Gm44CBCuOBiuWuouanmOOBruOCouOCq+OCpuODs+ODiO+8
iGxpbnV4LWYyZnMtCmRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldO+8ieOBq+OBpOOBhOOBpuWu
muacn+eahOOBqueiuuiqjeOCkuOBiumhmOOBhOOBl+OBpuOBiuOCiuOBvuOBmeOAggoK44K344K5
44OG44Og44Gu5a6J5a6a6YGL55So44Go5a6J5YWo5oCn5ZCR5LiK44Gu44Gf44KB44CBCuS4gOWu
muacn+mWk+OBlOOBqOOBq+OCouOCq+OCpuODs+ODiOaDheWgseOBruWGjeeiuuiqjeOCkuWun+aW
veOBl+OBpuOBiuOCiuOBvuOBmeOAggrjgYrmiYvmlbDjgpLjgYrjgYvjgZHjgYTjgZ/jgZfjgb7j
gZnjgYzjgIHkuIvoqJjjgojjgoroqK3lrprlhoXlrrnjgpLjgZTnorroqo3jgY/jgaDjgZXjgYTj
gIIKCuKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgArilqAg44GU56K66KqN44Gv44GT44Gh44KJ
ICAK8J+UlyAKaHR0cHM6Ly9tYXJ1bW9tb2RpcGFkaS5jby56YS93ZWJzZXJ2ZS9zbWxvZC9yb3Vu
ZGN1YmVqcC8jbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQgCu+8iOKAu+S4
iuiomOOBryBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQg5YWs5byP44K144Kk44OI44Gu44K744Kt44Ol
44Oq44OG44Kj44Oa44O844K444Gn44GZ77yJCuKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgAoK
44CQ56K66KqN5YaF5a6544CRICAK5a++6LGh44Ki44Kr44Km44Oz44OI77yabGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQgIArlrp/mlr3mnJ/pmZDvvJrmnKzjg6Hjg7zjg6vl
j5fkv6HlvowgMjQg5pmC6ZaT5Lul5YaFICAK5pel5pmC77yaMjAyNuW5tDHmnIgyM+aXpe+8iOmH
ke+8iTEyOjM4IAoK4oC744GK5b+D5b2T44Gf44KK44Gu44Gq44GE5aC05ZCI44CB44G+44Gf44Gv
56ys5LiJ6ICF44Gr44KI44KL5pON5L2c44Gu5Y+v6IO95oCn44GM44GC44KL5aC05ZCI44Gv44CB
ICAK5pys44Oh44O844Or44KS5YmK6Zmk44Gu44GG44GI44CB44K144Od44O844OI56qT5Y+j44G+
44Gn44GU6YCj57Wh44GP44Gg44GV44GE44CCCgrilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIAK
44CQ44GK5ZWP44GE5ZCI44KP44Gb5YWI44CRICAKbGlzdHMuc291cmNlZm9yZ2UubmV0IOOCq+OC
ueOCv+ODnuODvOOCteODneODvOODiOOCu+ODs+OCv+ODvCAgCuWPl+S7mOaZgumWk++8mjk6MDDj
gJwxODowMO+8iOW5tOS4reeEoeS8ke+8iSAgCumbu+ipse+8mjAxMjAtODYtMDAwMO+8iOODleOD
quODvOODgOOCpOODpOODq++8iSAgCuODoeODvOODq++8mnN1cHBvcnRAbGlzdHMuc291cmNlZm9y
Z2UubmV0CuKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgAoK4oC75pys44Oh44O844Or44Gv6YCB
5L+h5bCC55So44Ki44OJ44Os44K544GL44KJ6Ieq5YuV6YWN5L+h44GX44Gm44GK44KK44G+44GZ
44CCICAK44GU6L+U5L+h44GE44Gf44Gg44GE44Gm44KC5a++5b+c44GE44Gf44GX44GL44Gt44G+
44GZ44Gu44Gn44CB44GC44KJ44GL44GY44KB44GU5LqG5om/44GP44Gg44GV44GE44CCCgrku4rl
vozjgajjgoIgbGlzdHMuc291cmNlZm9yZ2UubmV0IOOCkuOBlOaEm+mhp+iznOOCiuOBvuOBmeOC
iOOBhuOBiumhmOOBhOeUs+OBl+S4iuOBkuOBvuOBmeOAggoK4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSACsKpIDIwMjYgbGlzdHMuc291cmNlZm9yZ2UubmV0IOOCt+OCueODhuODoOeuoeeQhumD
qArilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
