Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yBZHC5MtOWoBoAcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 14:41:55 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB256AF829
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 14:41:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=UcxHu3nH;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=YbcRKOdu;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=h4H9mZtR;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=OQxsNm4s;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUJIIM7kILRGDQ2ixP/AUNa5FYhtPN+tHJDEX7ywNgg=; b=UcxHu3nHUNtLxolfQFc7zBGDJt
	B1hReJ44QX04aVcLMflpf4lr3sfFBP6YZu0sUdnYunH6VN+7FcnSu1D4otgI1rExO4U4r5p3HPCTI
	kAlU2ccx1t1SOX09O+TBalQVHfznuI73DVn3VSFc4gqgJKe7lPtfmbBqMdjr/IAYLyNE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbdy9-0002dx-Oi;
	Mon, 22 Jun 2026 12:41:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wbdy8-0002dr-DV
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 12:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QGutXJ/UQR7Pm54Zrjalv+sNwgnUcPPhvyee6Rqu+sM=; b=YbcRKOduMLsob8tICw1hGfqqd/
 nmSzMC7rOJiJesssNIDjqLTKmi2XWTY1vexTIozQCsdWm+MtIpBDCVgLhcgy9h2Bjsx+Bv2K6n1kL
 83na/iFaP57CyGbVEn/EGd9cfhmHJX4OsDjua2pOuyTr8VUFyYA4DE8WNCSmnxBbZU0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QGutXJ/UQR7Pm54Zrjalv+sNwgnUcPPhvyee6Rqu+sM=; b=h4H9mZtRNwoFSKHV2/nD7pnBS6
 9lf5MjQaeD0G2ExK/EcZaUoA2YnIXQimmgki7ryslnmJKrVc+uJu3yNi4GOAl4RpEFeyri+p8o1pG
 Z08PsXOU4izL3ZdndXAlSR6dHJtUp7yaJ36XEbzDn9UaeZhkbROZZ/OQkMMdUnjb5KQk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbdy4-00067T-FG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 12:41:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 483EE6008A;
 Mon, 22 Jun 2026 12:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C7A1F000E9;
 Mon, 22 Jun 2026 12:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782132086;
 bh=QGutXJ/UQR7Pm54Zrjalv+sNwgnUcPPhvyee6Rqu+sM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=OQxsNm4sn4VTg03ihN8zkLau945H9lhQfIBCQGlPgx9vv0cJ8bERM0oiRpjKgsZEc
 Y+8RguJhc6DGxueH9X6BguAi3rcBeVta1LzamrGBL80SUOoQAGA0QJhMFjaTqVWrdt
 IMtvzjTFOVEqHtJ/Ww2nfIV1oa2mzXU1t7nN3m3T1Uqdl5sm9u0iAyHs3w0tf54Qlm
 caMYYfZNbIjsoXHkbdsZk/iI/jfbrfSM2HIk5uq5B+Rrk9F1Pny+QpuhTNXy3JEnk/
 5y+NMCQlfsbJRDlDObp4hkrXlNwIrlndMFyEa4b4I9D9mVs/zDLWcvnpYzFQek1BaJ
 G5HFkoSOdc3Ww==
Message-ID: <41cbc896-016c-411a-bb6e-950e8400ff41@kernel.org>
Date: Mon, 22 Jun 2026 20:41:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sunmin Jeong <s_min.jeong@samsung.com>, jaegeuk@kernel.org
References: <CGME20260622052831epcas1p205548491ce904c0cfda685ed05fe7cab@epcas1p2.samsung.com>
 <20260622052817.3972188-1-s_min.jeong@samsung.com>
Content-Language: en-US
In-Reply-To: <20260622052817.3972188-1-s_min.jeong@samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/22/26 13:28, Sunmin Jeong wrote: > Currently, the length
 of fallocate for pin file is section-aligned to > keep allocated sections
 from being selected as victims of GC. However, > for the case th [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wbdy4-00067T-FG
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to round down start offset of
 fallocate for pin file
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Sungjong Seo <sj1557.seo@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:s_min.jeong@samsung.com,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:sj1557.seo@samsung.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3FB256AF829

On 6/22/26 13:28, Sunmin Jeong wrote:
> Currently, the length of fallocate for pin file is section-aligned to
> keep allocated sections from being selected as victims of GC. However,
> for the case that the start offset of fallocate is not aligned in
> section, the allocated sections can't be fully utilized. It's because a
> new section is allocated by f2fs_allocate_pinning_section() after using
> blks_per_sec blocks regardless of the start offset. As a result, several
> unexpected dirty segments may be created, including blocks assigned to
> the pinned file.
> 
> To address this issue, let's round down the start offset of fallocate
> to the length of section.
> 
> The reproducing scenario is as below
> 
> chunk=$(((2<<20)+4096)) # 2MB + 4KB
> touch test
> f2fs_io pinfile set test
> f2fs_io fallocate 0 0 $chunk test
> f2fs_io fallocate 0 $chunk $chunk test
> f2fs_io fallocate 0 $((chunk*2)) $chunk test
> f2fs_io fiemap 0 $((chunk*3)) test
> 
> Fiemap: offset = 0 len = 12288
>     logical addr.    physical addr.   length           flags
> 0   0000000000000000 000000068c600000 0000000000400000 00001088
> 1   0000000000400000 000000003d400000 0000000000001000 00001088
> 2   0000000000401000 00000003eb200000 0000000000200000 00001088
> 3   0000000000601000 00000005e4200000 0000000000001000 00001088
> 4   0000000000602000 0000000605400000 0000000000200000 00001089
> 
> Cc: stable@vger.kernel.org
> Fixes: f5a53edcf01e ("f2fs: support aligned pinned file")
> Reviewed-by: Yunji Kang <yunji0.kang@samsung.com>
> Reviewed-by: Yeongjin Gil <youngjin.gil@samsung.com>
> Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
> Signed-off-by: Sunmin Jeong <s_min.jeong@samsung.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
