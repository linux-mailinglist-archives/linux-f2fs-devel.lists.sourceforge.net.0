Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F07A5DB88
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Mar 2025 12:29:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsKGt-0002nb-Cu;
	Wed, 12 Mar 2025 11:29:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tsKGs-0002nQ-6j
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 11:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SUPp1D/DrHcgnoaOoqAbJC/F3EY8Ze6kCsPUoP7ukNA=; b=cSQBuA8RL+WdaAqgHe8pzXsqql
 ORnPMRCSwKfcc0ZKB1lZ86/zW1CBC4eWpULmH69cCSfw0HW96Q2s3sJBvZE8/8FnMObVwad356lfu
 ISvJR9mOb7M4GB7fb9RiLSfQ+sH7b48EKMO76hSOvDsa+ZAiv9N3nop8H0Z0LX7SEDHc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SUPp1D/DrHcgnoaOoqAbJC/F3EY8Ze6kCsPUoP7ukNA=; b=jVLrQcvo9t/edetkzsLD16oINN
 UrzFkigSvoUhYhi1ydMR7JaTviiL1d0dS+Q8MZM4vDKN2iLMM4+uahVo8nM21Nt6i0eQGH3lPmDBh
 nm90XyaBa+9/Vwm1dJLvtP8s7UD96/+BSFDTLYtDwIwIhe6Tpv9QugFjcx39hD001e94=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsKGn-00053i-8k for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 11:29:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1F83D5C56BC;
 Wed, 12 Mar 2025 11:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704C2C4CEE3;
 Wed, 12 Mar 2025 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741778934;
 bh=+vV1V2eoLR31J9Ee8ZAsdPdScEOay5/Fbu7AWX0b4DU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Ey2qd3ZKS06k+V60Q99DwWpEJW4p4E21s8H7VBoEq8iIGdwUBRabDFFiUzNolA4me
 wj78QdfrtGtmsWFRtnSeO72TjguID5A/9GS7tb9r+m5facMLh0qqi3biPnqb51MqzH
 Zyzj8d2frYaCQiwRqa2aiFtIWNwcJjFrzEWHlgiRp4DM+0uXSbwMVSspOjMklphNEd
 0JL+jlrqwAKBnEiHYJqShNlRQctRAQmKJr9YAO5FxDcYx8eLm3UZHu9vxKh3qHSHRq
 jrg431ZZ9NtDV8Kf6uGgK1BEyq4DZav0fpRPush8Mbep+wyZjYvZ5f1xlT1fSsDVYA
 AOVrTvo76pdNw==
Message-ID: <9c66f3f4-2ea9-4322-91e8-fb88e2a055e5@kernel.org>
Date: Wed, 12 Mar 2025 19:28:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chunhai Guo <guochunhai@vivo.com>, jaegeuk@kernel.org
References: <20250312102005.2893698-1-guochunhai@vivo.com>
Content-Language: en-US
In-Reply-To: <20250312102005.2893698-1-guochunhai@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/12/25 18:20,
 Chunhai Guo wrote: > fstrim may miss candidates
 that need to be discarded, as shown in the > examples below. > > The root
 cause is that when cpc->reason is set with CP_DISCARD, > add [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tsKGn-00053i-8k
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix missing discard candidates in
 fstrim
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/12/25 18:20, Chunhai Guo wrote:
> fstrim may miss candidates that need to be discarded, as shown in the
> examples below.
> 
> The root cause is that when cpc->reason is set with CP_DISCARD,
> add_discard_addrs() expects that ckpt_valid_map and cur_valid_map have
> been synced by seg_info_to_raw_sit() [1], and it tries to find the
> candidates based on ckpt_valid_map and discard_map. However,
> seg_info_to_raw_sit() does not actually run before
> f2fs_exist_trim_candidates(), resulting in the failure.
> 
> The code logic can be simplified for all cases by finding all the
> discard blocks based only on discard_map. This might result in more
> discard blocks being sent for the segment during the first checkpoint
> after mounting, which were originally expected to be sent only in
> fstrim. Regardless, these discard blocks should eventually be sent, and
> the simplified code makes sense in this context.
> 
> root# cp testfile /f2fs_mountpoint
> 
> root# f2fs_io fiemap 0 1 /f2fs_mountpoint/testfile
> Fiemap: offset = 0 len = 1
>         logical addr.    physical addr.   length           flags
> 0       0000000000000000 0000000406a00000 000000003d800000 00001000
> 
> root# rm /f2fs_mountpoint/testfile
> 
> root# fstrim -v -o 0x406a00000 -l 1024M /f2fs_mountpoint -- no candidate is found
> /f2fs_mountpoint: 0 B (0 bytes) trimmed
> 
> Relevant code process of the root cause:
> f2fs_trim_fs()
>     f2fs_write_checkpoint()
>         ...
>         if (cpc->reason & CP_DISCARD) {
>                 if (!f2fs_exist_trim_candidates(sbi, cpc)) {
>                     unblock_operations(sbi);
>                     goto out; // No candidates are found here, and it exits.
>                 }
>             ...
>         }
> 
> [1] Please refer to commit d7bc2484b8d4 ("f2fs: fix small discards not
> to issue redundantly") for the relationship between
> seg_info_to_raw_sit() and add_discard_addrs().
> 
> Fixes: 25290fa5591d ("f2fs: return fs_trim if there is no candidate")
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

To Jaegeuk, I'm fine w/ this change, but discard is critical, could you
please double check it?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
