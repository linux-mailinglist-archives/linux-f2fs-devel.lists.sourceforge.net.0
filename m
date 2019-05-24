Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA0C28F6E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 May 2019 05:10:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hU0b0-0006wo-VP; Fri, 24 May 2019 03:10:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hU0az-0006wc-FD
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 03:10:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FEfEX1ZK9CEccnsOYmFljm5oFOyczRUQ751Cg+LjS+g=; b=cEvEZ4rIOL7KEHfzgy0VkiBoVJ
 H0JjDsKzbdbGfyV6/DnrD+28THhsfWbKnrKTT97XOjyx5TUwUMI+nyl6VFdVly+VBN5+G/CJBoTBY
 p0Pld9/nFLAUj4fk5nn58GcBlYVrPZC0UsHdPS9koGaSUhgdB5v/oBgiN+/zK+rNunbg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FEfEX1ZK9CEccnsOYmFljm5oFOyczRUQ751Cg+LjS+g=; b=NCyGGe5JhGvdayka2p49a+T7BO
 Weo3obBZlARfnlz5p/yn2WusnQuFHFvL/149du0UAi9wtF+l+KNXGhwL96QU3+p2Qig8/qGQVYaXW
 YHLVZb0YSznFGMnT2UMSXDuBX69nbvaFsEFsrU+gsezeuoGNDBRc241vjtwr8tYMMTYM=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hU0ax-004egG-B9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 03:10:13 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 200B26087D; Fri, 24 May 2019 03:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558667404;
 bh=O7cQI3hKqwLum3dHopYKUX9rFdvXxU3XnAEloPidYkw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KwcgVa2aLbELxlhUSZKkPZEkpNP+qGfug1/VE4DtHmC5AIZQAiqt+W1R3LkCvb/sN
 PEmBPBONx4nN3iS2WKb7lSVrRwcpr6GcVPH502i3r3hBToAuz/yxH37xdcqs82ZVjq
 aC72j52i4R9fd7DSpGsLnjCGa09hneTV44ishI8g=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: stummala@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D418660878;
 Fri, 24 May 2019 03:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558667403;
 bh=O7cQI3hKqwLum3dHopYKUX9rFdvXxU3XnAEloPidYkw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WuQbAxZ9GbJEdO1ImtXt4dxUx6Brtsq+dRj53DdHfIAxhNCxoNf45ng0buMrWweno
 txVw4F0fyn0jiRnVKgrWmB2p2KK3W8b64PvP87ms7v1JsBYnwBBZBPeolxtR7BCVl4
 sOctgbc2rTrMZ+16uESeWBzZcyT2EL6t8Va1Z8JM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D418660878
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Fri, 24 May 2019 08:39:58 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190524030958.GB10043@codeaurora.org>
References: <20190524015555.12622-1-sunqiuyang@huawei.com>
 <e7cfed52-0212-834f-aed8-0c5abc07f779@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7cfed52-0212-834f-aed8-0c5abc07f779@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hU0ax-004egG-B9
Subject: Re: [f2fs-dev] [PATCH v6 1/1] f2fs: ioctl for removing a range from
 F2FS
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
Cc: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 sunqiuyang <sunqiuyang@huawei.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 24, 2019 at 10:32:07AM +0800, Chao Yu wrote:
> +Cc Sahitya,
> 
> On 2019/5/24 9:55, sunqiuyang wrote:
> > From: Qiuyang Sun <sunqiuyang@huawei.com>
> > 
> > This ioctl shrinks a given length (aligned to sections) from end of the
> > main area. Any cursegs and valid blocks will be moved out before
> > invalidating the range.
> > 
> > This feature can be used for adjusting partition sizes online.
> > --
> > Changlog v1 ==> v2:
> > 
> > Sahitya Tummala:
> >  - Add this ioctl for f2fs_compat_ioctl() as well.
> >  - Fix debugfs status to reflect the online resize changes.
> >  - Fix potential race between online resize path and allocate new data
> >    block path or gc path.
> > 
> > Others:
> >  - Rename some identifiers.
> >  - Add some error handling branches.
> >  - Clear sbi->next_victim_seg[BG_GC/FG_GC] in shrinking range.
> > --
> > Changelog v2 ==> v3:
> > Implement this interface as ext4's, and change the parameter from shrunk
> > bytes to new block count of F2FS.
> > --
> > Changelog v3 ==> v4:
> >  - During resizing, force to empty sit_journal and forbid adding new
> >    entries to it, in order to avoid invalid segno in journal after resize.
> >  - Reduce sbi->user_block_count before resize starts.
> >  - Commit the updated superblock first, and then update in-memory metadata
> >    only when the former succeeds.
> >  - Target block count must align to sections.
> > --
> > Changelog v4 ==> v5:
> > Write checkpoint before and after committing the new superblock, w/o
> > CP_FSCK_FLAG respectively, so that the FS can be fixed by fsck even if
> > resize fails after the new superblock is committed.
> > --
> > Changelog v5 ==> v6:
> >  - In free_segment_range(), reduce granularity of gc_mutex.
> >  - Add protection on curseg migration.
> > 
> > Signed-off-by: Qiuyang Sun <sunqiuyang@huawei.com>
> > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> 
> Looks good to me now,
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> To Sahitya, is it okay to you merging all your fixes and adding Signed-off in
> original patch? We can still separate them from this patch if you object this,
> let us know.
> 

Hi Chao,

I am okay with merging.

Thanks,
Sahitya.

> Thanks,

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
