Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64659AAF1AB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 05:29:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bQKFgfM+Yzk5bJq7JUdHpPfG6KO6JPrdY2g3rc2dkk=; b=gPQbeCZsj7Dg5an2PpBXhuAjZZ
	gQi46rZKJqqErRIDPIsD6n71bhmn5X91sSpS/EBpOYtjJki8ioGwnmtqs5EeDdRIAKgdH7VK+P8mz
	LVwRSYbMFqRY2IDw3gcHixl/MBSfTLq6z9zmoifYcXAFk4cGmoB7yMgV8im5ir3PjODI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCrwg-0005pP-Ib;
	Thu, 08 May 2025 03:29:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCrwf-0005pJ-8c
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 03:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L2YcMRuDsnSGzFV/+AXsZQO/T30WTrV56HlLTVN7nlg=; b=EulKSKa+ybeNr95LpoNUkOAJUT
 /Jxz3yNDyR9s7CFjxhk9rZp7fDLxhi4VMTNKkmNvx4TB0wuyGANueCptcWilIMXyWJen3P/fbQuvo
 5aWfl8MNlg2XCJ8/pHz/5owR/dIFT6QDhhmbpglsix57z9dbJRui6DC2qRatKl4iltDc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L2YcMRuDsnSGzFV/+AXsZQO/T30WTrV56HlLTVN7nlg=; b=Qa90neCUtzItNVEgqDL2DmR9MJ
 C212C9qSnJQ0l8VamZnJtS5D7AVfrSk9Y61aA3MFdbeXDmhZWvmXImqWcXOU0FZrXWk/0pqcfNmMp
 bkjfJrqDPXnG87l3NqhQze5vxbE8/QdRXq2ciLCUdVxonDDQYoz/gMYJWeNKNo2S3MhE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCrwe-0007MI-HD for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 03:29:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C55D545001;
 Thu,  8 May 2025 03:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AFDC4CEE8;
 Thu,  8 May 2025 03:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746674941;
 bh=pCyYn4N03Oez00d6sol7X1wiGTbexMKVucPmEMi0IPk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=DDWeLQBqkgpfICJXdSRul+dq4RlkiTnu19VuG3L9CR74W81x6sF5Egv5CDgvc/D7r
 PvGEVufGsH9PdoaHVh0fpKtIkvQ6SGr2km5hWp/Jlb/vSbbOEc56zTO9ku0Tg0vFxS
 nFl5GEQcb6sPsHftw3b2Uy1r244u/NUu/9vuhaLBjQGxlIXBO0CeRlw02Au052//8D
 RfqnddBC2R6o3qi/pm6VvKe7RSokVZAE6jFYf7/tc/ptFMJTm7ZrTEYKZ2/UvZxFen
 VUgdDsp8BtEN8KCcir1N5jU+TToeJ3jbbOieePwB0rLQetkg4/3/O7dztdU+oPa5R1
 omz4EiuXJP10Q==
Message-ID: <e9a4bd0a-5f3c-4e13-ba4d-9f73782a37ba@kernel.org>
Date: Thu, 8 May 2025 11:28:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250420154647.1233033-1-sandeen@redhat.com>
 <20250420154647.1233033-3-sandeen@redhat.com>
 <2e354373-9f00-4499-8812-bcb7f00a6dbc@kernel.org>
 <db0c33f2-9fa0-4ee7-b5c9-e055fcc4d538@redhat.com>
Content-Language: en-US
In-Reply-To: <db0c33f2-9fa0-4ee7-b5c9-e055fcc4d538@redhat.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/7/25 20:31, Eric Sandeen wrote: > On 5/7/25 6:26 AM,
 Chao Yu wrote: >> On 4/20/25 23:25, Eric Sandeen wrote: >>> From: Hongbo Li
 <lihongbo22@huawei.com> >>> >>> In handle_mount_opt, we use fs_par [...] 
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
 Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
 Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCrwe-0007MI-HD
Subject: Re: [f2fs-dev] [PATCH 2/7] f2fs: move the option parser into
 handle_mount_opt
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
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/7/25 20:31, Eric Sandeen wrote:
> On 5/7/25 6:26 AM, Chao Yu wrote:
>> On 4/20/25 23:25, Eric Sandeen wrote:
>>> From: Hongbo Li <lihongbo22@huawei.com>
>>>
>>> In handle_mount_opt, we use fs_parameter to parse each option.
>>> However we're still using the old API to get the options string.
>>> Using fsparams parse_options allows us to remove many of the Opt_
>>> enums, so remove them.
>>>
>>> The checkpoint disable cap (or percent) involves rather complex
>>> parsing; we retain the old match_table mechanism for this, which
>>> handles it well.
>>>
>>> There are some changes about parsing options:
>>>   1. For `active_logs`, `inline_xattr_size` and `fault_injection`,
>>>      we use s32 type according the internal structure to record the
>>>      option's value.
>>
>> We'd better to use u32 type for these options, as they should never
>> be negative.
>>
>> Can you please update based on below patch?
>>
>> https://lore.kernel.org/linux-f2fs-devel/20250507112425.939246-1-chao@kernel.org
> 
> Hi Chao - I agree that that patch makes sense, but maybe there is a timing
> issue now? At the moment, there is a mix of signed and unsigned handling
> for these options. I agree that the conversion series probably should have
> left the parsing type as unsigned, but it was a mix internally, so it was
> difficult to know for sure.
> 
> For your patch above, if it is to stand alone or be merged first, it 
> should probably also change the current parsing to match_uint. (this would
> also make it backportable to -stable kernels, if you want to).
> 
> Otherwise, I would suggest that if it is merged after the mount API series,
> then your patch to clean up internal types could fix the (new mount API)
> parsing from %s to %u at the same time?
> 
> Happy to do it either way but your patch should probably be internally
> consistent, changing the parsing types at the same time.
> 
> (I suppose we could incorporate your patch into the mount API series too,
> though it'd be a little strange to have a minor bugfix like this buried
> in the series.)

Eric,

Yeah, it's a little bit strange to include that patch into mount API series,
now, I realize that rebasing huge change to a minor fix is not necessary,
anyway, let me focus on reviewing, and pickup that patch after mount API series
be merged. :P

Thanks,

> 
> Thanks,
> -Eric
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
