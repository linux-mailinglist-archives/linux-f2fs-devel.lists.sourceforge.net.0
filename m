Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6809E53968D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 May 2022 20:50:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nw6wq-0007ug-A2; Tue, 31 May 2022 18:50:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <info@lifecard.co.jp>) id 1nw6wp-0007uW-GZ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 May 2022 18:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:To:From:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ppIM2xG3sMUDEzYVlnu0IIaOjAYwPVDWjswhRS1soXw=; b=P4ZfbofMnY3Flstz5X4LrHtNCY
 IJkF4InB2muyo18/EqRGE8qVQmXk24L+pp23H+tZ5Mm9dh7fJ9kFdy3bnv9vuc7qNASIgUrGCEEdL
 78kcjFnTgo7eFyUbprJFJLAHYjFx3Tcu354ZBvIx3QKIE+zWyCUgLDjD5poXe7jbvLTI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:Date:To:From:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ppIM2xG3sMUDEzYVlnu0IIaOjAYwPVDWjswhRS1soXw=; b=Y
 sGVtupbsAaTrVDfhCbej5yMS30E3GdEaIsg9GdScrH+dldjCdbKjL79Bc2bf4dJlGGWQ1XB/M8wD6
 eScXhQRzX7SZDyxeheqcD8ur+SuE0egPW7fI21UiutdKXvP/Qfe6s2HLtkO2kr/vGSvL3qTtz2Qng
 sRB9QYaIXFsYegvg=;
Received: from [128.1.42.34] (helo=lifecard.co.jp)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.94.2)
 id 1nw6wm-00BhYq-88
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 May 2022 18:50:32 +0000
Message-ID: <20220531205028345251@lifecard.co.jp>
From: "lifecard" <info@lifecard.co.jp>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Tue, 31 May 2022 20:50:17 +0100
MIME-Version: 1.0
X-mailer: Ihejubyb 1
X-Spam-Score: 8.2 (++++++++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  ?ライフカードからのお知らせ? ライフカードをご利用のお客さま
    利用いただき、ありがとうございます。 このたび、ご本人様のご利用かどうかを確認させていた
    [...] 
 
 Content analysis details:   (8.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  1.2 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in
                             bl.spamcop.net
                 [Blocked - see <https://www.spamcop.net/bl.shtml?128.1.42.34>]
  1.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
                             [128.1.42.34 listed in dnsbl-1.uceprotect.net]
  0.0 T_SPF_HELO_PERMERROR   SPF: test of HELO record failed (permerror)
  0.0 T_SPF_PERMERROR        SPF: test of record failed (permerror)
  2.0 PYZOR_CHECK            Listed in Pyzor
                             (https://pyzor.readthedocs.io/en/latest/)
  2.7 FSL_BULK_SIG           Bulk signature with no Unsubscribe
  1.3 RDNS_NONE              Delivered to internal network by a host with no rDNS
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1nw6wm-00BhYq-88
Subject: [SPAM] 銉┿偆銉曘偒ードからのお知らせ
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
Content-Type: multipart/mixed; boundary="===============4763141398755780723=="
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

--===============4763141398755780723==
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: base64

DQo/pemlpKXVpaupYKXJpKuk6aTOpKrWqqTppLs/DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQql6aWkpdWlq6lgpcmk8qS0wPvTw6TOpKq/zaS1
pN4NCsD708OkpKS/pMCkraGipKKk6qSspMikpqS0pLakpKTepLmhow0KpLOkzqS/pNOhoqS0sb7I
y5iUpM6ktMD708Okq6TJpKakq6TytF/VSqS1pLukxqSkpL+kwKStpL+kpKSqyKHS/aSspKKk6qTe
pLekv6TOpMehog0K1Vyky4TZytakyqSspOmhoqWrqWClyaTOpLTA+9PDpPLSu7K/1sbP3qS1pLuk
xqSkpL+kwKStoaKktN9CvWqktaS7pMakpKS/pMCkraTepLekv6GjDQqkxKStpN6kt6TGpM+hotLU
z8Kk2KWipa+lu6W5pM7Jz6GipaupYKXJpM6ktMD708O0X9VKpMuktIVmwaak8qSq7oqkpNbCpLek
3qS5oaMNCiAgpKq/zZiUpMukz6S0w9S786GipLTQxMXkpPKkqpLspLGkt6Gi1Vyky8nqpLfUVaS0
pLakpKTepLuk86GjDQq6ztfkpLTA7b3ipKSkv6TApK2kv6SvpKruiqSkyeqkt6SipLKk3qS5oaMN
CqS0u9i08KTypKSkv6TApLGkyqSkiPa6z6GipaupYKXJpM6ktMD708PWxs/epKy+QL5BpLWk7KTr
pLOkyKTipLSktqSkpN6kuaTOpMehotPopOENCqS0wcuz0M/CpLWkpKXepLQNCg0KqIvA+9PDtF/V
SqTPpLOkwaTpqIsNCmh0dHBzOi8vd3d3My1saWZlY2FyZC1jby1qcC5jYXB0YWlucHJhY3RpY2Fs
LmNvbT9lb3ZuZzV5LjI5eA0KDQqx18nnpM+hoqWkpfOlv6lgpc2lw6XIyc+kzrK71f3Q0J7ppM63
wNa5oaTS1tbGpM7TUbXjpKuk6aW1paSlyKTIpLekxqTO0MXubdDUoaTV/bWx0NQNCqTyuN+k4aTr
pL+k4Q0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQo/pemlpKXVpaupYKXJpM+kqqXIpa+kyqWtpeOl86XaqWCl86SsyqKk6qTApK+ktaTzIT8N
CqXepa2l46XzpdmpYKXzx+mI86TPpLOkwaTppKuk6Q0KaHR0cHM6Ly93d3czLWxpZmVjYXJkLWNv
LWpwLmNhcHRhaW5wcmFjdGljYWwuY29tP21mYmEua211aXJxcXc1DQoNCj97TElGRS1XZWIgRGVz
a6Wipdal6qG5pM6ktMD708Okz6Wipdal6qSspaul86W/pfMmsePA+yE/DQqkqtankkK98O5+pOSl
3aWkpfOlyMr9pKyk0qTIxL+kx7Rf1Uqkx6StpOuhorHjwPukyqW5pd6l26Wipdal6qTHpLmhow0K
pd6lwKWmpfOl7algpcmkz6SzpMGk6aSrpOkNCmh0dHBzOi8vd3d3My1saWZlY2FyZC1jby1qcC5j
YXB0YWlucHJhY3RpY2FsLmNvbT8zZnZya3RxLmYybm51DQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCqSqhpakpLrPpO+kuzpodHRwczovL3d3
dzMtbGlmZWNhcmQtY28tanAuY2FwdGFpbnByYWN0aWNhbC5jb20/eHVuNy43ZnNxcmF3azgNCrBr
0MXUqiA6pemlpKXVpaupYKXJ1urKvbvhyeeWfL6ptry428f41qW2/rahxL8zMbesMTm6xaXQpfOl
tqWkpdOl6w0KofmxvqXhqWCl66TP19SE08Xk0MWktaTspMakpKTepLmho6S0t7XQxaSkpL+kwKSk
pMak4qSqtPCkqKTHpK2k3qS7pPOkzqTHpLTBy7PQpK+kwA0KpLWkpKGjDQoNCqH505vdZKTOVVJM
SaTPUEOhpKW5pd6pYKXIpdWlqaXzpKuk6aWipa+lu6W5pLekxqSvpMCktaSkoaMNCqH5pLTA+9PD
pM62y8SppKqk6KTT1E+2qKTLpOikw6TGpM+7rcPm33fSxqS3pMqkpIj2us+krKS0pLakpKTepLmh
ow0K




--===============4763141398755780723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============4763141398755780723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

--===============4763141398755780723==--
