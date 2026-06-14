Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wEVfLRH/LWoDoQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Jun 2026 03:08:33 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA93680273
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Jun 2026 03:08:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=UjPmKNvG;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=DbHsH3rv;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="H 0AacSq";
	dkim=fail ("body hash did not verify") header.d=yygwb.net header.s=default header.b=Qp9F4QMi;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Date:To:Message-ID:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DnIJmnUvqoHNJkEkDqPeKJusQaV1r2UGrx8XfD4PwBE=; b=UjPmKNvGOrfCo1/buUgPzxHqUc
	Yuw2qCUTjjIT3eK3C5rUkbSNgTLWTTzyt75G70ZKjDKsYSTEZVFpqgl4H8l2d1NudpG47QWeOQS1L
	Mc6U6vCYFFSx6W6FewniDN8tryBYsXVg8WTqC/QACg8ZlBx6pkOgn9+T/fu4umDCG8oU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wYZKo-000624-AN;
	Sun, 14 Jun 2026 01:08:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <info@yygwb.net>) id 1wYZKm-00061x-OV
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Jun 2026 01:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:To:From:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LX2WhMW0B5jyIXqNlATcGK3yF1P4ROiNzgToCZrX8mM=; b=DbHsH3rvvncN0ehFNrAkv+z/o4
 lgDuEdeZE356quG0/F8e156ywEI5pThgividKEHSxH7LBkFuLSmKGaMvQ85gTtNl95a4iOVQTiZfl
 QeU72X2hZQMr5I7Hl6wJytvjnQASQFRBQDv4Vo3ECjMg295dHcEqW/WmKrPgO1dORl7k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:Date:To:From:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LX2WhMW0B5jyIXqNlATcGK3yF1P4ROiNzgToCZrX8mM=; b=H
 0AacSqD1VMbk8/mc9/E3VRf4SCufZZnXBpt2yZQgxHHzpxm0BJqKQxcCCOd3ALJKNoAvgMLBGe1B7
 KFsY9/YV3TC4w4KPijOzN9Vll2dXQRSCVa64o/3Lt+BNr+USp3PvsCjGPzDfwciBO2tJ2R5QX+mEk
 VlfuPb+D6Cj8TRLo=;
Received: from yygwb.net ([160.251.123.157] helo=mail.yygwb.net)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wYZKi-0006q5-0G for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Jun 2026 01:08:18 +0000
Received: from gaoyizhi.com (unknown [103.143.80.197])
 by mail.yygwb.net (Postfix) with ESMTPA id 88FD73FB23
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 14 Jun 2026 09:48:41 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yygwb.net; s=default;
 t=1781398121; bh=Ys4zK/FqG0pAGg+9//BByOTfyPUcu9RcAAUgP1FEBSI=;
 h=From:To:Subject:Date:From;
 b=Qp9F4QMifEF6AaR0V7fwnolJ0a/K0Y1cQll26RPRthskTK2JeZ2XKTc92K/5THhWV
 20DWpdRkW3YoWsqb9EHrS+iRdWsWvUMXecUkQI7TeaD2THY7egETd5DBkJg0AUN6yq
 NyGzeXEkw+cen2K8QYb5LLkfx9EJwE7iHDOScV37VK2mfKxVgfPURko5N+xe1ktODA
 ZgvLReNHoQAllb/Ec7S4ivTVkbqr2wxncSGzOKRddY0/+gWYm/vuUYHWOgczRRaVCu
 xWNqgGUrAeosrDi1qwOisaifnEDGGu3epUxnAagTvUb9+mfosc2JRUEIW/rypnePVt
 VhVbZ4pJ+yCDg==
Message-ID: <4647a73cc4b670bb68e687131911359f@yygwb.net>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Sun, 14 Jun 2026 08:49:13 +0800
X-Priority: 3
X-Mailer: wrxqqfi atkrjmwr mamorny 7.43823.64850.79807
MIME-Version: 1.0
X-Spam-Score: 7.0 (+++++++)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  いつもJRE POINTをご利用いただき、誠にありがとうございます。
    このたび、期間限定のキャンペーンを実施いたします。
    対象期間中、応募条件をすべて満たした方の中から抽選で、
    JRE POINTを最大20,000ポイントプレゼントいたします！ 
 
 Content analysis details:   (7.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.5 SUBJ_ALL_CAPS          Subject is all capitals
  2.5 XM_RANDOM              X-Mailer apparently random
  1.7 RAZOR2_CHECK           Listed in Razor2 (http://razor.sf.net/)
  2.4 RAZOR2_CF_RANGE_51_100 Razor2 gives confidence level above 50%
                             [cf: 100]
  0.0 FSL_BULK_SIG           Bulk signature with no Unsubscribe
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1wYZKi-0006q5-0G
Subject: [SPAM] 【JRE POINT】アトレ・アトレヴィ・プレイアトレ キャンペーン｜最大20,000ポイントプレゼント
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
From: =?utf-8?Q?JRE_POINT=E4=BA=8B=E5=8B=99=E5=B1=80?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?Q?JRE_POINT=E4=BA=8B=E5=8B=99=E5=B1=80?= <info@yygwb.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.29 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SPAM_FLAG(5.00)[];
	ABUSE_SURBL(5.00)[jrepoint.zxycaiqk.cn:url];
	SUBJECT_NEEDS_ENCODING(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_ONE(0.00)[1];
	TO_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:216.105.38.7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,yygwb.net:s=default];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
	HAS_REPLYTO(0.00)[info@yygwb.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,yygwb.net:-]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBA93680273

44GE44Gk44KCSlJFIFBPSU5U44KS44GU5Yip55So44GE44Gf44Gg44GN44CB6Kqg44Gr44GC44KK
44GM44Go44GG44GU44GW44GE44G+44GZ44CCDQoNCuOBk+OBruOBn+OBs+OAgeacn+mWk+mZkOWu
muOBruOCreODo+ODs+ODmuODvOODs+OCkuWun+aWveOBhOOBn+OBl+OBvuOBmeOAgg0KDQrlr77o
saHmnJ/plpPkuK3jgIHlv5zli5/mnaHku7bjgpLjgZnjgbnjgabmuoDjgZ/jgZfjgZ/mlrnjga7k
uK3jgYvjgonmir3pgbjjgafjgIENCkpSRSBQT0lOVOOCkuacgOWkpzIwLDAwMOODneOCpOODs+OD
iOODl+ODrOOCvOODs+ODiOOBhOOBn+OBl+OBvuOBme+8gQ0KDQrilrwg44Kt44Oj44Oz44Oa44O8
44Oz5pyf6ZaTDQoyMDI25bm0NuaciDE05pel77yI5pel77yJ772eMjAyNuW5tDbmnIgyMeaXpe+8
iOaXpe+8iQ0KDQrilrwg5b+c5Yuf5p2h5Lu2DQrku6XkuIvjga7mnaHku7bjgpLjgZnjgbnjgabm
uoDjgZ/jgZnmlrnjgYzlr77osaHjgajjgarjgorjgb7jgZnjgIINCg0K4pGgIOOCreODo+ODs+OD
muODvOODs+acn+mWk+S4reOBq+OAgeOCouODiOODrOODu+OCouODiOODrOODtOOCo+WQhOW6l+OD
u+ODl+ODrOOCpOOCouODiOODrOWcn+a1puOBpw0KICAg5ZCI6KiIMjAsMDAw5YaG77yI56iO6L68
77yJ5Lul5LiK44GK6LK344GE5LiK44GSDQoNCuKRoSDjgYrkvJroqIjjga7pmpvjgavjgIFKUkUg
UE9JTlTjgYzosq/jgb7jgovjgqvjg7zjg4njgb7jgZ/jga8NCiAgIOODkOODvOOCs+ODvOODieOC
kuaPkOekug0KDQrilrwg5b2T6YG45YaF5a6577yI5oq96YG477yJDQoNCjHnrYnvvJpKUkUgUE9J
TlQgMjAsMDAw44Od44Kk44Oz44OIIOKApiAxMDDlkI3mp5gNCjLnrYnvvJpKUkUgUE9JTlQgMTAs
MDAw44Od44Kk44Oz44OIIOKApiAzMDDlkI3mp5gNCjPnrYnvvJpKUkUgUE9JTlQgNSwwMDDjg53j
gqTjg7Pjg4ggIOKApiAxLDAwMOWQjeanmA0KNOetie+8mkpSRSBQT0lOVCAxLDAwMOODneOCpOOD
s+ODiCAg4oCmIDUsMDAw5ZCN5qeYDQoNCuKWvOOBk+OBruOCreODo+ODs+ODmuODvOODs+OBr+OC
qOODs+ODiOODquODvOOBjOW/heimgeOBp+OBmeOAgg0KaHR0cHM6Ly9qcmVwb2ludC56eHljYWlx
ay5jbi8/anJlcG9pbnQ9WyVNaXhMZXROdW0oMTIsMTYpXQ0KDQrigLsg5b2T6YG46YCa55+l44Gv
44Od44Kk44Oz44OI44Gu5LuY5LiO44KS44KC44Gj44Gm5Luj44GI44GV44Gb44Gm44GE44Gf44Gg
44GN44G+44GZ44CCDQrigLsg44Od44Kk44Oz44OI44Gu5LuY5LiO44GvMjAyNuW5tDfmnIjkuK3m
l6zku6XpmY3jgpLkuojlrprjgZfjgabjgYrjgorjgb7jgZnjgIINCuKAuyDlvZPpgbjjg53jgqTj
g7Pjg4jjga8yMDI25bm0OeaciOacq+aXpeOBvuOBp+OBruacn+mWk+mZkOWumuODneOCpOODs+OD
iOOBqOOBquOCiuOBvuOBmeOAgg0KDQrjgZPjga7mqZ/kvJrjgavjgZzjgbLjgZTlj4LliqDjgY/j
gaDjgZXjgYTjgIINCg0K44GU5LiN5piO44Gq54K544GM44GU44GW44GE44G+44GX44Gf44KJ44CB
44GK5rCX6Lu944GrSlJFIFBPSU5U44K144Od44O844OI44K744Oz44K/44O844G+44Gn44GK5ZWP
44GE5ZCI44KP44Gb44GP44Gg44GV44GE44CCDQoNCuKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgA0K5p2x5pel5pys5peF5a6i6YmE6YGT5qCq5byP5Lya56S+DQrigLvjgZPjga7jg6Hjg7zj
g6vjga/pgIHkv6HlsILnlKjjgafjgZnjgILjgZTov5Tkv6HjgYTjgZ/jgaDjgZHjgb7jgZvjgpPj
gIINCuKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgAoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
