Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D2442C2B6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Oct 2021 16:17:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1maf4R-0001sq-0T; Wed, 13 Oct 2021 14:17:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1maf4K-0001sZ-8Z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Oct 2021 14:17:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z66hH6f+rrfNA6LO5TQwnmVmx66BPz+M0IFUmUdgPDI=; b=mM2BzV2shlLtWcdaRANOOdssC5
 UA04jCXzQR1ToU+616tgDhTO9K+/lJIO77NOZmsRI31RAcl+BngubOb0Drrjgo0KOlHDD/OoBTEGU
 uNojqDU7JrKtQ64VqZeje1CzLvCp9ym/NbE25Irx+S74FByCPQ/iJAmUjU25oWxKPrjc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z66hH6f+rrfNA6LO5TQwnmVmx66BPz+M0IFUmUdgPDI=; b=ZwhPs38hSo1A6wchlIUv6cypk+
 ry7l2AF9AMxsWC665dS/M3pcHSxwjCtHTGE+x/RUgmkFmIytZx5Rc765CeqDTcdJn9OsrL2WP0ZaE
 oEPuD0qT4x8vJ5J0sxBR9qimi9CgclIPvXJe2mQuU8Nc3LAcg3Wp6j5Mieir8EViehpA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1maf4J-00038H-O5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Oct 2021 14:17:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB85D60F4A;
 Wed, 13 Oct 2021 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634134634;
 bh=xGaUNIV0JKCxDoZu8SaySJLNpamLkm5J0/iXLpj5oJ4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fV7TI00+eX44IfKk43MRiPWw5rHehObyw2gsMLdynvyHhM7Bx+TChWOLGcPqWQJG2
 /CXcQxGIR5ObaCM8iH9OyAJlr6L+hzpsclbrm8p2GCFJRSzBqNRAVmfWTOF53dGrf3
 lVHHk513wRQoOiQOgFxR+2Q2E0GIE0BMK/da3bwp2aETMan2SrnFHLdkW2/1kDBNdv
 Gxtmo23g8eQt+0OpBCbREiQ4yJVnKei/8jzLvYecRJja++ucvCX8MtK6lIxl8wfP3B
 c16idrtcnNcSpDpae/vbjCo4gIMQo9dXsskVfrPuHYF14ufeizfiscnRzaUSoqqm8d
 F1Wd7kCqB06uw==
Message-ID: <16840026-35ba-cce6-4e0b-3332b0902d2a@kernel.org>
Date: Wed, 13 Oct 2021 22:17:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>
References: <20211006174910.2964885-1-daeho43@gmail.com>
 <5743eeca-a6e8-87d4-5799-c622fbada429@kernel.org>
 <CACOAw_zfDZMB4pLEuHWU5YcKnAtfBBTSuXwXy+L2rNJxXC3ysg@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_zfDZMB4pLEuHWU5YcKnAtfBBTSuXwXy+L2rNJxXC3ysg@mail.gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/10/12 0:02,
 Daeho Jeong wrote: >>> diff --git a/fs/f2fs/compress.c
 b/fs/f2fs/compress.c >>> index c1bf9ad4c220..9b663eaf4805 100644 >>> ---
 a/fs/f2fs/compress.c >>> +++ b/fs/f2fs/compress.c >> [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1maf4J-00038H-O5
Subject: Re: [f2fs-dev] [PATCH] f2fs: include non-compressed blocks in
 compr_written_block
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/10/12 0:02, Daeho Jeong wrote:
>>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>>> index c1bf9ad4c220..9b663eaf4805 100644
>>> --- a/fs/f2fs/compress.c
>>> +++ b/fs/f2fs/compress.c
>>> @@ -1530,6 +1530,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
>>>        if (cluster_may_compress(cc)) {
>>>                err = f2fs_compress_pages(cc);
>>>                if (err == -EAGAIN) {
>>> +                     add_compr_block_stat(cc->inode, cc->cluster_size);
>>
>> Shouldn't we relocate this after 'write' label?
>>
>> One more concern, it looks we've changed what compr_block stat indicated,
>> literally, the block we account should be compressed..., how about accounting
>> it by introducing .presist_blocks, used_blocks or occupied_blocks.... thoughts?
>>
> 
> What I wanted to add here is just one case in which compression was
> tried, but couldn't save any block, so gave up.
> If we put this below the "write" label, we will count blocks, even if
> the file is turned off for compression in "user-controlled
> compression" mode.
> Like the commit comment says, I want to estimate the overall compression rate.
> But, if we include every other compression disabled condition, it
> won't work like that.

Got it, thanks for the explanation.

Any thoughts about renaming compr_block? since some blocks accounted in
.compr_block weren't compressed blocks.

Thanks,

> 
> Thanks,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
