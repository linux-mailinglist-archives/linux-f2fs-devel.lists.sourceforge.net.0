Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE16CK45tGl3jAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 17:22:06 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F47286E8A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 17:22:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogBtHAekF0CdrCbggoQi+REZHmUg9edI5sA4dFhdnq8=; b=czk7xFBvotNVwOmK/FUQm5abam
	KtOu5CcBPCWr139vgBk3BR6LpPCLVg8fdX1x2ZNpLyVjRzEbrhadWRNXjmjkcRQZzUFYwxklDj34s
	JtkTRZL4buU4FiaGDocJQEIm7cooBTQRlGRDefIh/A/5AZsChVsbRiVgtMJtw44X6QmQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w15Gq-0007Zr-H3;
	Fri, 13 Mar 2026 16:21:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1w15Gm-0007ZU-4w
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 16:21:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jPK/GRVD5kDqrmo2KwoysZA6Uyhvujeu9lACo9z7WdA=; b=SRp8+VX9ao6B4nW4ezJ4kjmIf4
 r+sklyved9dyqiqvVswZXmbFhIk5bjo0jOiiv6H9dkD2FCWnsrbRmPgS1QCgRjbRH36wn3siJOn5b
 mdEzobguzaF3+1Td9hz1nIv2W5gUm3G+p9uNVQ3q0oxOjvgBZ5YX3nwY+Ldsa/p9tt+w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jPK/GRVD5kDqrmo2KwoysZA6Uyhvujeu9lACo9z7WdA=; b=jEjOA+qR1uwiRdph0ypAOlJiej
 90/GqAA/sLezDyLgEV3ffrddoC4NitGi58FJmPiSMyqnj0mCM8vQWKRfGR0WcGM/tQW4Yjt61vN2t
 FBWNfizpcGfjhxdVLXTP+MDMK1qAib04JeXpEvLZ5pWVp0j5RiJLJWy5iyH9FvN8GNP8=;
Received: from mail-vs1-f49.google.com ([209.85.217.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w15Gl-0007Hp-Ic for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 16:21:48 +0000
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-5ffabb1dfbaso1319155137.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Mar 2026 09:21:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773418901; cv=none;
 d=google.com; s=arc-20240605;
 b=aqUwinO93N4/JRRldB/CxeYsWEyF5ySHnFxH3ATpyAsTTYcbCx5X+W2jAQ7A8s8JE2
 sJHfZ7Kj1hkGmTk51GOMByvZlXUknyTV9wmkpaGBLoIF4wlk3fMk1K2gXfeg/Mo4Rr1T
 yT17BCjwVT9d0naC60RlUGuvoeuHJC0o7AoItzijMSAbHOxhFd6g1KcxheVyCTlde0yz
 DuB5SLFpRLf1szaINZjQnqjCOFQqJ32oTe3pLCWRFHN3UAvNXoRJ8DDnhJasCJ7AtaNp
 zKPm0CZr4CTLBzd2km7X7XYDdUzOVrdUQ/wrbVtHjMiozaRs+CohyM5lWuIx9RttFYd+
 mpcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=jPK/GRVD5kDqrmo2KwoysZA6Uyhvujeu9lACo9z7WdA=;
 fh=f0oSbdyfO/ioC7eSBYb2Hk1wYA3D9f9mp7sKYSc9ayU=;
 b=jLjSAAKM1L53cKos0opbvP6AeiWwU9ajKA1ITFfMVBKe5et57g9y7oFZhuY77FAlrA
 4Tiqzufepibvf064sSYArNZ+X/D7a8HlbluYtRiIYe7AnV586Elfc1hcMhtAwVuDTRIF
 +tYwOq6UN5SIiF5l97CM8tJEIyskYynwhELCYcVVSbXT+QLCnk3LyG7LxN/qoLdZxIfB
 KuT7rkjGqlm8QxTQmIKblgkB/Gm/sDCS5lqw3X+d2NrAnZrLtHkYoePhOW0ZnMBlk3lA
 jCCh6RxW53JnCPNDDvm2c5q+Xc10gqVFH8QYIQd39AaUsTH3harvEG8fB81wcWU83kNR
 Soug==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773418901; x=1774023701; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jPK/GRVD5kDqrmo2KwoysZA6Uyhvujeu9lACo9z7WdA=;
 b=i37IruCGni/wj3qCvMYi1rIvMZ0QZfUTgb8jhHaTp6L3sJXVstchCgg0wtPG6z/1UX
 usK+ABo8dxrd3n1Qfut5wmdnNWIxJkfs6ei5OJSJIhvC63WEMt3uKp025c7cEEAeg/ir
 YzHoJEztK8ctdfnpdvn4poDFcAzbrh2CkuFyuuGA2jprtP1f94PGSuKP6kslScbv3RI9
 egqZMInrIWfE3n1nTWKumm/3BLeg7GgLQze4qLfjEO/WXFJ7YMzcm4jvvARBGtaflg7l
 HyNjz2Up1uP8VipJG8Q5J4F5yg9DbQ2IbHV8MP2pX5Pfb3XGD3ZL4QdHKy8nYj5QhYjZ
 r7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773418901; x=1774023701;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jPK/GRVD5kDqrmo2KwoysZA6Uyhvujeu9lACo9z7WdA=;
 b=D3kaMET5PTshXQiufurFh+TjyXH9NXgXI2hjmaRziW4s0tEKsFwNGYH2UMMaPmgpQm
 f0psv4D8x6EcMXOyGFRH1CsCuYkIJgIcaCMWhdtugzIM8gJI3gUQDsZnrurIRI1cZtSN
 rKGMPG5maGpZWffN4nLHslV5748ltGF2eIEa3/o1LOu5YjvOA4lreCTONQXoPn0Swmu0
 9g8V4RlQtgxBb4D17N5WYEqeJfaGMtLsN/xQUd1mkVYclFqdlZsyt0N7fwRmvne0lViP
 vfcR95bgIucMFIp6hpHvqw74WieZiIBVJ3ZDLnHCLaoVgLcMqqZHuly8UELfeIhJmGQt
 C6Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx3q4zzgxbRW9kA96jJuUqT3/4Ht/CWEzw+RuHQg3Q0rG3aav+Ku+JSCLn8yHIZHypT69HKB/3QCLnAHjEMJKI@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx3dtbdW7P/oYiqB1Dqpxx4gOh9xxu9AjDi7xTH/YVHYbNZd3OH
 d0o/Th2sIwlCEV3rtpK3g/omuZj4ZJ4y0rNPD4tDwPJARW0WyVNCeHm3YckB6614UjptlNdSo6+
 BLZlSPJjl/gSSouQqgaz2VMkOnIE1YoapCg==
X-Gm-Gg: ATEYQzxrOUXFJ1CX8EpkNsgExEgqDLaDqlMjHUoNOKovvQRNfmjiNfrZ9V0CeagxE+u
 vO8qOfyFhLdLk8FmbJ/aVpqNGt18RjvPBEWbeFcxhCH7W4DSrOrKnzZmaXXJIOVxYUD7+ehdUTI
 xa9GEu6yhkGUfzkWL4TWbiNixcIUlqcxWPQk5bxHs7a9joOHI35X7bUa3lLnjSMsvpFYE5Q9vub
 uAaxhROazp0h/zOXs5hE648gYxQDk4DXRagKsc8a4hNftDElSZc3VPVLhYL/AEMKOYXAzzQ2WjA
 eGpc8vSrsnUgI3IXOkdy4DITp5P48xXsIROV738y6fnzwgc7yUYRnON2Nl7eVWghfgxPGKEq
X-Received: by 2002:a05:6102:c8e:b0:5ee:a494:1747 with SMTP id
 ada2fe7eead31-6020e5694e3mr2008711137.36.1773418901471; Fri, 13 Mar 2026
 09:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260310175428.1156719-1-daeho43@gmail.com>
 <fbaaef01-5a66-407e-b447-b5741b42d309@kernel.org>
 <CACOAw_yXPoSBox4o5pMv_0Jv0B8yHA6TFakcKNOpGZWKBSZYKw@mail.gmail.com>
 <615947f2-fe08-4875-87d9-baef36897e81@kernel.org>
 <CACOAw_wUpR=8qXi06VLCk_oH5qL+_RVqzMAP8x4JaTE9Te3WQw@mail.gmail.com>
 <2625a3fc-7dc6-4764-877c-ffeeeb42276c@kernel.org>
In-Reply-To: <2625a3fc-7dc6-4764-877c-ffeeeb42276c@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 13 Mar 2026 09:21:30 -0700
X-Gm-Features: AaiRm52QTMrMoFkjkhw7UyoJzrMLDd-ooVJLcJv8LdcluKmnTDgeJSYaGhuCpGU
Message-ID: <CACOAw_wJunzUqUY2CKiEDqGKNSeFF8J_e=Qj2BqRoON=dJB==A@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 12,
 2026 at 11:49 PM Chao Yu wrote: > > On 3/12/2026
 11:28 PM, Daeho Jeong wrote: > > On Thu, Mar 12, 2026 at 2:07 AM Chao Yu
 wrote: > >> > >> On 2026/3/12 00:05, Daeho Jeong wrote: > [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_SIGNED             Message has a ARC signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.49 listed in wl.mailspike.net]
X-Headers-End: 1w15Gl-0007Hp-Ic
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to skip empty sections in
 f2fs_get_victim
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:daehojeong@google.com,m:kernel-team@android.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 08F47286E8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBNYXIgMTIsIDIwMjYgYXQgMTE6NDnigK9QTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gMy8xMi8yMDI2IDExOjI4IFBNLCBEYWVobyBKZW9uZyB3cm90ZToK
PiA+IE9uIFRodSwgTWFyIDEyLCAyMDI2IGF0IDI6MDfigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMjAyNi8zLzEyIDAwOjA1LCBEYWVobyBKZW9uZyB3
cm90ZToKPiA+Pj4gT24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgNjo0NOKAr0FNIENoYW8gWXUgPGNo
YW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gT24gMjAyNi8zLzExIDAxOjU0LCBE
YWVobyBKZW9uZyB3cm90ZToKPiA+Pj4+PiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bn
b29nbGUuY29tPgo+ID4+Pj4+Cj4gPj4+Pj4gSW4gYWdlLWJhc2VkIHZpY3RpbSBzZWxlY3Rpb24g
KEFUR0MsIEFUX1NTUiwgb3IgR0NfQ0IpLCBmMmZzX2dldF92aWN0aW0KPiA+Pj4+PiBjYW4gZW5j
b3VudGVyIHNlY3Rpb25zIHdpdGggemVybyB2YWxpZCBibG9ja3MuIFRoaXMgc2l0dWF0aW9uIG9m
dGVuCj4gPj4+Pj4gYXJpc2VzIHdoZW4gY2hlY2twb2ludCBpcyBkaXNhYmxlZCBvciBkdWUgdG8g
cmFjZSBjb25kaXRpb25zIGJldHdlZW4KPiA+Pj4+PiBTSVQgdXBkYXRlcyBhbmQgZGlydHkgbGlz
dCBtYW5hZ2VtZW50Lgo+ID4+Pj4+Cj4gPj4+Pj4gSW4gc3VjaCBjYXNlcywgZjJmc19nZXRfc2Vj
dGlvbl9tdGltZSgpIHJldHVybnMgSU5WQUxJRF9NVElNRSwgd2hpY2gKPiA+Pj4+PiBzdWJzZXF1
ZW50bHkgdHJpZ2dlcnMgYSBmYXRhbCBmMmZzX2J1Z19vbihzYmksIG10aW1lID09IElOVkFMSURf
TVRJTUUpCj4gPj4+Pj4gaW4gYWRkX3ZpY3RpbV9lbnRyeSgpIG9yIGdldF9jYl9jb3N0KCkuCj4g
Pj4+Pj4KPiA+Pj4+PiBUaGlzIHBhdGNoIGFkZHMgYSBjaGVjayBpbiBmMmZzX2dldF92aWN0aW0n
cyBzZWxlY3Rpb24gbG9vcCB0byBza2lwCj4gPj4+Pj4gc2VjdGlvbnMgd2l0aCBubyB2YWxpZCBi
bG9ja3MuIFRoaXMgcHJldmVudHMgdW5uZWNlc3NhcnkgYWdlCj4gPj4+Pj4gY2FsY3VsYXRpb25z
IGZvciBlbXB0eSBzZWN0aW9ucyBhbmQgYXZvaWRzIHRoZSBhc3NvY2lhdGVkIGtlcm5lbCBwYW5p
Yy4KPiA+Pj4+PiBUaGlzIGNoYW5nZSBhbHNvIGFsbG93cyByZW1vdmluZyByZWR1bmRhbnQgY2hl
Y2tzIGluIGFkZF92aWN0aW1fZW50cnkoKS4KPiA+Pj4+Pgo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6
IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPj4+Pj4gLS0tCj4gPj4+Pj4g
ICAgIGZzL2YyZnMvZ2MuYyB8IDkgKysrLS0tLS0tCj4gPj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPj4+Pj4KPiA+Pj4+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9nYy5jIGIvZnMvZjJmcy9nYy5jCj4gPj4+Pj4gaW5kZXggMmUwZjY3OTQ2
OTE0Li45ODFlYWM2MjlmZTkgMTAwNjQ0Cj4gPj4+Pj4gLS0tIGEvZnMvZjJmcy9nYy5jCj4gPj4+
Pj4gKysrIGIvZnMvZjJmcy9nYy5jCj4gPj4+Pj4gQEAgLTUyMSwxMiArNTIxLDYgQEAgc3RhdGlj
IHZvaWQgYWRkX3ZpY3RpbV9lbnRyeShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPj4+Pj4g
ICAgICAgICBzdHJ1Y3Qgc2l0X2luZm8gKnNpdF9pID0gU0lUX0koc2JpKTsKPiA+Pj4+PiAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgbG9uZyBtdGltZSA9IDA7Cj4gPj4+Pj4KPiA+Pj4+PiAtICAgICBp
ZiAodW5saWtlbHkoaXNfc2JpX2ZsYWdfc2V0KHNiaSwgU0JJX0NQX0RJU0FCTEVEKSkpIHsKPiA+
Pj4+PiAtICAgICAgICAgICAgIGlmIChwLT5nY19tb2RlID09IEdDX0FUICYmCj4gPj4+Pj4gLSAg
ICAgICAgICAgICAgICAgICAgIGdldF92YWxpZF9ibG9ja3Moc2JpLCBzZWdubywgdHJ1ZSkgPT0g
MCkKPiA+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4+Pj4+IC0gICAgIH0K
PiA+Pj4+PiAtCj4gPj4+Pj4gICAgICAgICBtdGltZSA9IGYyZnNfZ2V0X3NlY3Rpb25fbXRpbWUo
c2JpLCBzZWdubyk7Cj4gPj4+Pj4gICAgICAgICBmMmZzX2J1Z19vbihzYmksIG10aW1lID09IElO
VkFMSURfTVRJTUUpOwo+ID4+Pj4+Cj4gPj4+Pj4gQEAgLTg4OSw2ICs4ODMsOSBAQCBpbnQgZjJm
c19nZXRfdmljdGltKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgdW5zaWduZWQgaW50ICpyZXN1
bHQsCj4gPj4+Pj4gICAgICAgICAgICAgICAgIGlmIChzZWNfdXNhZ2VfY2hlY2soc2JpLCBzZWNu
bykpCj4gPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0Owo+ID4+Pj4+Cj4g
Pj4+Pj4gKyAgICAgICAgICAgICBpZiAoIWdldF92YWxpZF9ibG9ja3Moc2JpLCBzZWdubywgdHJ1
ZSkpCj4gPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4dDsKPiA+Pj4+Cj4gPj4+
PiBXZWxsLCBmb3IgZjJmc19nZXRfdmljdGltKCwgQVRfU1NSKSwgb25jZSB0aGVyZSBhcmUgbm8g
ZGlydHkgc2VnbWVudCwgaWYgd2UKPiA+Pj4+IGRvbid0IGNvdW50IGZyZWUgc2VnbWVudCBhcyBj
YW5kaWRhdGVzLCB0aGVuLCB3ZSBjYW4gbm90IGZpbmQgYW55IHZhbGlkIHZpY3RpbT8KPiA+Pj4K
PiA+Pj4gT2gsIEFUX1NTUiBuZWVkcyB0byBzZWxlY3QgdGhlIGZyZWUgc2VjdGlvbiBpbiB0aGlz
IGNhc2U/Cj4gPj4KPiA+PiBJIHRoaW5rIHNvLCBmb3IgZXh0cmVtZSBjYXNlLgo+Cj4gT2gsIGNo
ZWNrIHRoZSBjb2RlIGFnYWluLCBpdCBzZWVtcyB3ZSBzZWxlY3QgdmljdGltIGZyb20gZGlydHkg
Yml0bWFwLAo+IHRoZSB2aWN0aW0gc2hvdWxkIG5vdCBiZSBhIGZyZWUgb25lLi4uCj4KPiBCdXQg
dGhlcmUgaXMgc29tZSBleGNlcHRpb25zOgo+Cj4gbG9jYXRlX2RpcnR5X3NlZ21lbnQoKQo+Cj4g
ICAgICAgICBpZiAodmFsaWRfYmxvY2tzID09IDAgJiYgKCFpc19zYmlfZmxhZ19zZXQoc2JpLCBT
QklfQ1BfRElTQUJMRUQpIHx8Cj4gICAgICAgICAgICAgICAgIGNrcHRfdmFsaWRfYmxvY2tzID09
IHVzYWJsZV9ibG9ja3MpKSB7Cj4gICAgICAgICAgICAgICAgIF9fbG9jYXRlX2RpcnR5X3NlZ21l
bnQoc2JpLCBzZWdubywgUFJFKTsKPiAgICAgICAgICAgICAgICAgX19yZW1vdmVfZGlydHlfc2Vn
bWVudChzYmksIHNlZ25vLCBESVJUWSk7Cj4KPiBJZiB2YWxpZF9ibG9ja3MgZXF1YWxzIHRvIHpl
cm8sIGJ1dCBpZiB0aGUgY2hlY2twb2ludCBpcyBkaXNhYmxlZCBhbmQgYWxzbwo+IGNrcHRfdmFs
aWRfYmxvY2tzIGRvZXNuJ3QgZXF1YWxzIHRvIHVzYWJsZV9ibG9ja3MuIFRoZSBzZWdtZW50IChv
ciBzZWN0aW9uKQo+IHdpbGwgc3RpbGwgYmUgZGlydHkgc3RhdGUgaW4gZGlydHkgYml0bWFwLgo+
Cj4gV2UgbmVlZCB0byBoYW5kbGUgdGhpcyBjb3JyZWN0bHkgaW4gZjJmc19nZXRfdmljdGltKCkg
Y29ycmVjdGx5IGJlZm9yZSBjYWxsaW5nCj4gaW50byBhZGRfdmljdGltX2VudHJ5KCkgb3IgZ2V0
X2djX2Nvc3QoKT8KPgo+Cj4gICAgICAgICAgICAgICAgIC8qIERvbid0IHRvdWNoIGNoZWNrcG9p
bnRlZCBkYXRhICovCj4gICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseShpc19zYmlfZmxhZ19z
ZXQoc2JpLCBTQklfQ1BfRElTQUJMRUQpKSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlm
IChwLmFsbG9jX21vZGUgPT0gTEZTKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAvKgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICogTEZTIGlzIHNldCB0byBm
aW5kIHNvdXJjZSBzZWN0aW9uIGR1cmluZyBHQy4KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAqIFRoZSB2aWN0aW0gc2hvdWxkIGhhdmUgbm8gY2hlY2twb2ludGVkIGRhdGEuCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChnZXRfY2twdF92YWxpZF9ibG9ja3Moc2JpLCBzZWdubywgdHJ1ZSkp
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4dDsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLyoKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIFNTUiB8IEFU
X1NTUiBhcmUgc2V0IHRvIGZpbmQgdGFyZ2V0IHNlZ21lbnQKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAqIGZvciB3cml0ZXMgd2hpY2ggY2FuIGJlIGZ1bGwgYnkgY2hlY2twb2lu
dGVkCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBhbmQgbmV3bHkgd3JpdHRl
biBibG9ja3MuCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICghZjJmc19zZWdtZW50X2hhc19mcmVlX3Nsb3Qo
c2JpLCBzZWdubykpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdv
dG8gbmV4dDsKPiAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4KPiAgICAgICAgICAgICAgICAg
ICAgICAgICBpZiAoIWdldF92YWxpZF9ibG9ja3Moc2JpLCBzZWdubywgdHJ1ZSkpCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXgo+IENhbiB0aGlz
IGJlIHRoZSBmaXg/CgpEaWQgeW91IHNheSBBVF9TU1IgY2FuIHVzZSBhIGZyZWUgc2VnbWVudD8g
SWYgd2UgcHV0IHRoaXMgY29uZGl0aW9uCmhlcmUsIEFUX1NTUiB3aWxsIG5vdCB1c2UgYSBmcmVl
IHNlZ21lbnQgYW55bW9yZS4KCj4KPiA+Pgo+ID4+PiBJIGFtIGNvbmZ1c2VkLiBXaHkgZG8gd2Ug
bmVlZCB0aGUgYmVsb3cgbG9naWM/Cj4gPj4+IExvb2tzIGxpa2UgV0EgZm9yIHRoZSBBVF9TU1Ig
Y2FzZT8KPiA+Pj4KPiA+Pj4gSW4gZjJmc19nZXRfc2VjdGlvbl9tdGltZSgpCj4gPj4+IG91dDoK
PiA+Pj4gICAgICAgICAgIGlmICh1bmxpa2VseShtdGltZSA9PSBJTlZBTElEX01USU1FKSkKPiA+
Pj4gICAgICAgICAgICAgICAgICAgbXRpbWUgLT0gMTsKPiA+Pj4gICAgICAgICAgIHJldHVybiBt
dGltZTsKPiA+Pgo+ID4+IFRoZXJlIGFyZSB0d28gY29uZGl0aW9ucywgaW4gYSBzZWN0aW9uOgo+
ID4+Cj4gPj4gYSkgaWYgdGhlcmUgYXJlIG5vIHZhbGlkIGJsb2NrcywgaXQgd2lsbCByZXR1cm4g
SU5WQUxJRF9NVElNRS4KPiA+PiBiKSBpZiB0aGVyZSBhcmUgdmFpbGQgYmxvY2tzLCBpdCB0cmll
cyB0byByZXR1cm4gbXRpbWUgd2hpY2ggaXMgY2FsY3VsYXRlZCwgYnV0Cj4gPj4gaWYgdW5sdWNr
eSB0aGUgY2FsY3VsYXRlZCBtdGltZSBpcyBlcXVhbCB0byBJTlZBTElEX01USU1FLCBpbiBvcmRl
ciB0byBkaXN0aW5ndWlzaAo+ID4+IGZyb20gY2FzZSBhKSwgd2Ugd2lsbCByZXR1cm4gSU5WQUxJ
RF9NVElNRSAtIDEgaW5zdGVhZC4KPiA+Cj4gPiBJZiB3ZSBmaW5kIGEgZnJlZSBzZWdtZW50IGFu
ZCBwYXNzIGl0IHRvIGYyZnNfZ2V0X3NlY3Rpb25fbXRpbWUoKSBmb3IKPiA+ICghX19pc19sYXJn
ZV9zZWN0aW9uKHNiaSkpIGNhc2UuCj4gPiBXaGF0IGlzIHRoZSBleHBlY3RlZCBvdXRwdXQgb2Yg
aXQ/IChJTlZBTElEX01USU1FIC0gMSk/Cj4KPiBJdCBkZXBlbmRzIG9uIHRoZSBzdGF0dXMgb2Yg
c2VjdGlvbiB0aGF0IGZyZWUgc2VnbWVudCBiZWxvbmcgdG86Cj4gSWYgdGhlcmUgaXMgbm8gdmFs
aWQgYmxvY2sgaW4gdGhlIHNlY3Rpb24sIGl0IHdpbGwgcmV0dXJuIElOVkFMSURfTVRJTUUsCj4g
b3RoZXJ3aXNlIGl0IHdpbGwgcmV0dXJuIGNhbGN1YXRlZCBtdGltZSwgb3IgSU5WQUxJRF9NVElN
RSAtIDEgZm9yCj4gZXh0cmVtZSBjYXNlIHRoYXQgbXRpbWUgaXMganVzdCB1bmx1Y2tpbHkgZXF1
YWxzIHRvIElOVkFMSURfTVRJTUUuCj4KPiBUaGFua3MsCj4KPiA+IEkgZG9uJ3QgdGhpbmsgdGhp
cyBpcyBqdXN0IGFuIHVubHVja3kgY2FzZS4gSXMgdGhpcyBleHBlY3RlZCByZXN1bHQ/Cj4gPgo+
ID4+Cj4gPj4gVGhhbmtzLAo+ID4+Cj4gPj4+Cj4gPj4+Cj4gPj4+Pgo+ID4+Pj4gVGhhbmtzLAo+
ID4+Pj4KPiA+Pj4+PiArCj4gPj4+Pj4gICAgICAgICAgICAgICAgIC8qIERvbid0IHRvdWNoIGNo
ZWNrcG9pbnRlZCBkYXRhICovCj4gPj4+Pj4gICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseShp
c19zYmlfZmxhZ19zZXQoc2JpLCBTQklfQ1BfRElTQUJMRUQpKSkgewo+ID4+Pj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGlmIChwLmFsbG9jX21vZGUgPT0gTEZTKSB7Cj4gPj4+Pgo+ID4+Cj4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
