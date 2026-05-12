Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHGfMsGIAmrVtwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 03:56:17 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA8D518816
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 03:56:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Date:To:Message-ID:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yhzd+Bn7P31l9QqPcautCdVHTPtrvgMXqDVXZM2fL1o=; b=ETn53XI9z0SPginPRdxo7N68GK
	4oJ7r6dmYE1ZKBirnSRoNSbM+e25fw5/rbE8xQwajWQr7lQswAGpH9B869sQ50MlgdaeCZ+3sv//3
	xVoqRMfPts2ku653jGYjv/dSv+eC3n9Fi0M3KPwcU53TNNFPYGhy7K6DFkqvdHzOTocA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wMcLr-0002IB-VJ;
	Tue, 12 May 2026 01:56:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <info@6gsb8.cn>) id 1wMcLq-0002I3-8h
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 01:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Subject:To:From:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LkON3VbxV8amasdPffHD5o9pvmOU3nyvj7G4u0QiJN8=; b=HLcE9oLI6EqwfsUb4dG7KWDDkB
 9d7oIE1lTN+7hCvEwnJqNrl9r/ldU757WIoDZR9sNyCoob29R3muKIYFu1hy6c+HXzhAYrsk96AUJ
 ECx2hHta07qo86LWv0FXhtL8Sn316sQ7FJQc0+CZO4HfXiU0bIOuo5JInvAKoc8CbB3I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:To:From:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LkON3VbxV8amasdPffHD5o9pvmOU3nyvj7G4u0QiJN8=; b=G
 BqFZZGMWrO5TxxmekI/4KLzNcqHwemQTucOnJ+5RdGDyPKbtafkUYy6hiPOVFRY78+nyXCAZi1sJ7
 QpG+xUhXBAE4kSH1C/FZfcHS2/X3zYybf5YKjfJ0T/XEMqsNui/S7jP48poZMz/oUVZ8PlCf94ocE
 h+jR0pfIw2S+t0jg=;
Received: from v160-251-254-107.v18w.static.cnode.jp ([160.251.254.107]
 helo=mail.6gsb8.cn) by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wMcLl-00024h-7H for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 01:55:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=6gsb8.cn;
 h=Message-ID:From:To:Subject:Date:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=info@6gsb8.cn;
 bh=LkON3VbxV8amasdPffHD5o9pvmOU3nyvj7G4u0QiJN8=;
 b=TiRN8+58JvoXJ6ssI5EUf2N3sixa6TRqFSfZjLloMUO1DySXwTr5rtkIFL90pQXMLi3aexHu1sun
 fv/2hf3tps+/xWMZ+/gE9exAM6fyXepNzHzyNUf8clr1dmsJ92AHAeXf0CKRoOFqTr57D/f1ofoA
 nmuhpfBhKJk8oKUX8yw=
Message-ID: <d53216ffbdbc3f20b588e71d0dca1dda@6gsb8.cn>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Tue, 12 May 2026 09:35:26 +0800
MIME-Version: 1.0
X-Spam-Score: 1.9 (+)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  いつもVポイントをご利用いただき、ありがとうございます。
    Vポイント2周年を記念して、 抽選で15,000円相当のVポイントをプレゼントします。
    【期間】2026年5月1日 ～ 2026年5月31日 【付与】2026年6月中旬
    以降、順次 
 
 Content analysis details:   (1.9 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  2.0 NO_FM_NAME_IP_HOSTN    No From name + hostname using IP address
X-Headers-End: 1wMcLl-00024h-7H
Subject: [f2fs-dev] =?utf-8?b?44CQMuWRqOW5tOelreOAkeacgOWkpzE1LDAwMOWGhg==?=
	=?utf-8?b?55u45b2TVuODneOCpOODs+ODiOODl+ODrOOCvOODs+ODiA==?=
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
From: =?utf-8?B?VuODneOCpOODs+ODiOOCreODo+ODs+ODmuODvOODsw==?= via
 Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?B?VuODneOCpOODs+ODiOOCreODo+ODs+ODmuODvOODsw==?=
 <info@6gsb8.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 1BA8D518816
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	PH_SURBL_MULTI(7.50)[info-vpoint.hbstnypt.com:url];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_EQ_FROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,6gsb8.cn:s=default];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,6gsb8.cn:-];
	HAS_REPLYTO(0.00)[info@6gsb8.cn];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	TO_DN_NONE(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:216.105.38.7];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hbstnypt.com:url]
X-Rspamd-Action: no action

44GE44Gk44KCVuODneOCpOODs+ODiOOCkuOBlOWIqeeUqOOBhOOBn+OBoOOBjeOAgeOBguOCiuOB
jOOBqOOBhuOBlOOBluOBhOOBvuOBmeOAgg0KDQpW44Od44Kk44Oz44OIMuWRqOW5tOOCkuiomOW/
teOBl+OBpuOAgQ0K5oq96YG444GnMTUsMDAw5YaG55u45b2T44GuVuODneOCpOODs+ODiOOCkuOD
l+ODrOOCvOODs+ODiOOBl+OBvuOBmeOAgg0KDQrjgJDmnJ/plpPjgJEyMDI25bm0NeaciDHml6Ug
772eIDIwMjblubQ15pyIMzHml6UNCuOAkOS7mOS4juOAkTIwMjblubQ25pyI5Lit5pesIOS7pemZ
jeOAgemghuasoQ0KDQoxNSwwMDDlhobnm7jlvZMNCuKWvCDlj4LliqDjga/jgZPjgaHjgonvvIjj
g63jgrDjgqTjg7PjgZnjgovjgaDjgZHvvIkNCmh0dHBzOi8vaW5mby12cG9pbnQuaGJzdG55cHQu
Y29tLw0KDQrigLsg5oq96YG444Gr44KI44KL5pWw6YeP6ZmQ5a6a44OX44Os44K844Oz44OIDQri
gLsgVuODneOCpOODs+ODiOOCouOCq+OCpuODs+ODiOOBjOW/heimgeOBp+OBmQ0K4oC7IOW9k+mB
uOiAheOBq+OBr+WIpemAlOW9k+mBuOODoeODvOODq+OCkuOBiumAgeOCiuOBmeOCi+WgtOWQiOOB
jOOBlOOBluOBhOOBvuOBmeOAgg0K4oC7IOOBiuS4gOS6uuanmDHlm57pmZDjgorjga7lv5zli5/j
gajjgZXjgZvjgabjgYTjgZ/jgaDjgY3jgb7jgZnjgIINCg0K4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSADQpW44Od44Kk44Oz44OI5LqL5YuZ5bGADQrigLvjgZPjga7jg6Hjg7zjg6vjga/p
gIHkv6HlsILnlKjjgafjgZnjgILjgZTov5Tkv6HjgYTjgZ/jgaDjgZHjgb7jgZvjgpPjgIINCuKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
