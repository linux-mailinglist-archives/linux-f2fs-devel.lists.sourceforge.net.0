Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3PfRLGx7Qmob8QkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2026 16:04:28 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F9E6DBB5D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2026 16:04:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=kIjpGUDN;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=lOkW+ar6;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=NATZ2QyZ;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=rNqhQfnh;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fT3cxwHWxt2Ygzqc/dSYfoCfyk3QQDxuVNZgphWHomU=; b=kIjpGUDNJFDy+/t9XOi0Tj+jJK
	eSbdymChkJpPRE2O+nmxZADfUH73BHiDpdGYwwUK1jjUTcdFXJPl9/+5Wpz3wR0S736irmXybyXP9
	+M2Cn3Z3jpm2f/JTiGobX5mG8SQIze37lQDweedd78O48ojheNw5hZXKHH3RrnnKfWas=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1weCau-0001HY-T1;
	Mon, 29 Jun 2026 14:04:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rollkingzzc@gmail.com>) id 1weCaq-0001HP-SN
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jun 2026 14:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tUehWCSRQ+v5FHT3tphe18K12RRbx/sBstHMf7G+7LM=; b=lOkW+ar6JnCgMAi5uyXV743EXC
 PPZHVHlJfjsrDa7mdQ03MtxDHaPtSCDvuIKNYV65/q6H2GF6DOyU4roKsznd14fQnpDYwi/hmda+c
 5HTugEvYwjKikopWBt2R2A3gT3HpnZjNncgjRdMGnuohcjzUwj/iTEimajMAVNs4s8Sw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tUehWCSRQ+v5FHT3tphe18K12RRbx/sBstHMf7G+7LM=; b=NATZ2QyZW5hhyPt8wNAgMQE4l3
 AIG1sJ77wqcxAp/uCEVZr2lFg52TgPoAYNVVoGjDGol4QaHn4l3upScSXhhd9y7MncUKSLtEOTsOr
 xID0t/XIPH2xWgUWRF5Eul//+jlaHdl8sGGtVqbqAs7bHHA7DEm7VkjpBV7zm0MIRLNQ=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1weCaq-0001eJ-0M for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jun 2026 14:04:12 +0000
Received: by mail-lf1-f65.google.com with SMTP id
 2adb3069b0e04-5aeb7467a8dso1131861e87.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Jun 2026 07:04:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782741846; cv=none;
 d=google.com; s=arc-20260327;
 b=FgfvSqeG/oMPlXDsQl7MPQTaMs2D0ktWDF5NC4XH+chwtmQlUN4aj6kj/7+cqUszgI
 k5CbFD3JCLxbzUOdnQZ5+FJfW2apUYNFgywVWgs+/twXhOv1AxMZoZmm2H3sMQRHwInR
 pm/+XGoI4yYYB+YkwYzJ2lhrV5Kn6Boe4tdSU1GsbK4VgmFDYvQLd0fkokSH0CtJt7XP
 zWSQULRsdACNQWcdktEDvXtxKGj3LtMLMGvhg6yhfPP+bAb/4iNX0Gaeo9b0zD5/7jQg
 lxHNEbThD6cGEiIdTUEsyKm+6qBNTiY7RGJQ7C3lZ5bOQhOtiHIpbqx6WwrDokvJCT9v
 cr4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=tUehWCSRQ+v5FHT3tphe18K12RRbx/sBstHMf7G+7LM=;
 fh=LGY6XXrAO2AoO7VPc1fEkV/HrWrDfIIGfi3aEHemzRc=;
 b=nnFbVDkNCq+stJbU9BGLjdts95zf/e+pcfs5nMSFEymVCObuzczAELNhlcap+CRxJZ
 9A2BD3k/b/K98Z13JSzgX++bOZiyxoFf1C/TXbAV0USyjM4cO3aRsviQ9pcZgQMu+iX9
 gSzFtNJfjYW6E6ZeiRQsh1pTyJrN4ggZRDusmuMECW/rRZzgQOrwwB/DRkq7o+2QfMzG
 v2Yj9/zJh5E+2kvd2dTtr6LeMcs0HX3GcmE8QiEc6w1YLIoUXq0jLD6bKx+Gi6lZWsAa
 6WAm1LrwrV1manG8x5JRPiQHAUsG9CtIybMEcVoYS78s7tUNljc7ooSHt4/qzrHoNlk1
 fGTg==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782741846; x=1783346646; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tUehWCSRQ+v5FHT3tphe18K12RRbx/sBstHMf7G+7LM=;
 b=rNqhQfnhZV8POK4p6JWFtKFKMdQM5zgzqYFdZfGRT/0RtuXqItdu/u8Z/Kx4avyhZf
 eQ2OIB35MPUcHH5iP4/myoqNPwI/RgX9nx0jPUb4a0bf0DF9EN7Wu+fJ47NJVPCH44OS
 pyizG57P1gQAYBkxUCwlBOdWRedlzchbyHichJU5gzW9aAKdVaaIIQBpM09mp3TiCuxv
 Rs6H42ufY7fb6Vs7IurGsKrE8Yb7f+1GmbLK/F/ext95CMWivSHtacacEGu/ji+oc9VQ
 5iQNfsYZczbWKxcQqMqPmnhWxOsu5w20cwDaGAE54B/G/gk9mLpsY3EB8/P0EnkktoFo
 d2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782741846; x=1783346646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tUehWCSRQ+v5FHT3tphe18K12RRbx/sBstHMf7G+7LM=;
 b=L0weh/MFHeTDYUVocXsHrRe91Vq6QMa2f3h6cO5doSU/n4pKMqbK9k0oT3HaG+6eYB
 0iQ3YX2HVNDeeYQaWkoTb1KaEdWapLajSOV1A4SRhYOQNPjCQTLKZuwlNnSutqlf12cz
 KiJnorGlnGlN1d8d+8JQDn5aZhdC+4pJzVTPJ6/Wx7fe3LMRHTdL79yvhJkHQ+hpcilA
 eipMmb3vbmjs50UqR96Tei7s1+THnIanUmQ0tYw6YSYCXXml6crL7fWn+TFr4zzpm7r3
 2OuYcF90wqYPkr4rqn1KxHcqgNkpEpZQzljHy/fnG2w8fccNgnh8enSnTDPlNm6LNvuE
 r9Sw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrOVf1lusdna1FIaZmRIZPKvOSBbJ+NpZIdshRVVbbXXqvS+ElFzx0m1GUf26rH1MP7ecxfWIpQCFN2j6ZNeCM/@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyvShDpOxYGjJDuGW9/vz9VlPxVBvtFLRW8CftFWsBWNNDGKiet
 gBCym+s+5078KRfTYfLYdadseMCJ8zOoxTg8Sz/L3FzYTHf1t+oBbbDo6g2vCaqndOHgflYWk99
 doDUmIdOanuaw4kjUhNoega/wu3ilyOM=
X-Gm-Gg: AfdE7cmhh+JV9nvr54+xrMsh1NXw4Vfd6G5uVHZdSwJjqU2JnotYfna7VIuemsA/6q7
 4MoySFhcGPODpqQUowFMOctnsu8b/AwAEx8UG24nkwgS3NWla1vxvIEC5E/+biwW34z7Sr/O9Ia
 LN+9WSJRWVVdcb+9u6Vaaqzax/9u/9T37o2ISpAfUyQAVNo8wXSVxJZfgU+wguLhP/450tJn3ji
 LosNqNNInSkusQ37Lj0kM6a+zxrCyhEaQf8iulAQay4JHcnQPbJrN1h7lhm0O5S9FJs/hq8slxi
 DxTGdxNPHJcijv+5a5DC5vkHym2LXNLJiLehEVwPJHU3C5Ubv+rj4kgL/PdBWhmdvrI=
X-Received: by 2002:ac2:4e06:0:b0:5ae:b7c7:5334 with SMTP id
 2adb3069b0e04-5aeb7c755f8mr1225933e87.17.1782741845445; Mon, 29 Jun 2026
 07:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260616064904.3616123-1-rollkingzzc@gmail.com>
 <CAB7XQsG0J84HrgPb0Q6448syWPaNdp=K+Yvrre2uf5jpo6mP-g@mail.gmail.com>
 <1cb10ab5-7f87-49be-b525-bc148624ad6e@kernel.org>
In-Reply-To: <1cb10ab5-7f87-49be-b525-bc148624ad6e@kernel.org>
From: Cen Zhang <rollkingzzc@gmail.com>
Date: Mon, 29 Jun 2026 22:03:53 +0800
X-Gm-Features: AVVi8CeFuzt5xMNpmtdI6q9kmBDLVhlHJPCsbzXWD5L4lhLttikOtEW7T4DDi40
Message-ID: <CAB7XQsGGZioeaf0bKz7DYYwUwP6++JHoTkxioLs19mY1Co99wQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 2.8 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, > > Can you please take a look this: > > f2fs: embed
 f2fs_gc_kthread in f2fs_sb_info > > I guess we need to fix race case on
 sbi->gc_thread
 by embedding the sturture > into f2fs_sb_info, and then you [...] 
 Content analysis details:   (2.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 1.0 FORGED_GMAIL_RCVD 'From' gmail.com does not match 'Received' headers
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [rollkingzzc(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.65 listed in wl.mailspike.net]
X-Headers-End: 1weCaq-0001eJ-0M
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: protect published gc_thread during
 teardown
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, zerocling0077@gmail.com,
 2045gemini@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:zerocling0077@gmail.com,m:2045gemini@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0F9E6DBB5D

Hi Chao,

>
> Can you please take a look this:
>
> f2fs: embed f2fs_gc_kthread in f2fs_sb_info
>
> I guess we need to fix race case on sbi->gc_thread by embedding the sturture
> into f2fs_sb_info, and then you can fix race case on sbi->gc_thread.f2fs_gc_task
> w/ lock or ref something like that?

Thanks for the review and the patch.

I'll take a look at your patch and try to fix this based on it.

Best regards,
Zhang Cen


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
