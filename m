Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FB0183EC4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2020 02:46:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jCZOb-0000a9-1U; Fri, 13 Mar 2020 01:45:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jCZOZ-0000Zx-3O
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Mar 2020 01:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b9/b7bE9KTxVxI9uuF80Hmje+jImq1gFOBY8r53F4LM=; b=MdNcT7mB/j+cW1IycTy61E3/iV
 kSPCK7H3UeQ+Ki5M5J9uE6cavZC+5lxrMUVi677POHPcez7lh6A7/4rS4WhElNoeZxHe+fZ8kDbf/
 TIf/GoL33H4JJco4ivRny7SyZZuAbPPwVlB+RDRbGit1f0WX/wUqrSXrBU7xENntOFK8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b9/b7bE9KTxVxI9uuF80Hmje+jImq1gFOBY8r53F4LM=; b=Aq9GuSU4uk848Ao4sTVSe7AFwL
 g9vvyxRH60CSoA6TSxwPMmng2cVfGfrnr6a1ZkioaqHSGdccIytqckrLkRWdHqFX1znQuEdwU9OOT
 sP/uzBYc7RNweph2JeMlVtsWbE7Jcf+3MgXQtoZ2obNOQwlQ1ObPeXK5IXu6v6zMMQoQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jCZOV-00HMnE-A2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Mar 2020 01:45:51 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 00EFA206EB;
 Fri, 13 Mar 2020 01:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584063936;
 bh=eOeeLsiw73oz23MELGRqbWNabA9/QJa23yrnUToudVM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KpuV21MXLiAl8IdbIWtXwY3FgUU8dBbJ9WEo93Kwg+/GbAoFuNFGEfl/f/SaBxTIY
 be3GCDYZZlblAInUV8NiFetDEY4YfF/f0t23vKmPCD8pVdooMxCVlRIfLPmlZHLemP
 cvpyyBOHJc1NiUw1RwXDYvTCQbstB8PkklyaTh20=
Date: Thu, 12 Mar 2020 18:45:35 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sahitya Tummala <stummala@codeaurora.org>
Message-ID: <20200313014535.GA72547@google.com>
References: <1584011671-20939-1-git-send-email-stummala@codeaurora.org>
 <20200312170242.GA185506@google.com>
 <20200313012604.GI20234@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313012604.GI20234@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.0 (/)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jCZOV-00HMnE-A2
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix long latency due to discard during
 umount
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/13, Sahitya Tummala wrote:
> On Thu, Mar 12, 2020 at 10:02:42AM -0700, Jaegeuk Kim wrote:
> > On 03/12, Sahitya Tummala wrote:
> > > F2FS already has a default timeout of 5 secs for discards that
> > > can be issued during umount, but it can take more than the 5 sec
> > > timeout if the underlying UFS device queue is already full and there
> > > are no more available free tags to be used. In that case, submit_bio()
> > > will wait for the already queued discard requests to complete to get
> > > a free tag, which can potentially take way more than 5 sec.
> > > 
> > > Fix this by submitting the discard requests with REQ_NOWAIT
> > > flags during umount. This will return -EAGAIN for UFS queue/tag full
> > > scenario without waiting in the context of submit_bio(). The FS can
> > > then handle these requests by retrying again within the stipulated
> > > discard timeout period to avoid long latencies.
> > > 
> > > Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > > ---
> > >  fs/f2fs/segment.c | 14 +++++++++++++-
> > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > index fb3e531..a06bbac 100644
> > > --- a/fs/f2fs/segment.c
> > > +++ b/fs/f2fs/segment.c
> > > @@ -1124,10 +1124,13 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
> > >  	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> > >  	struct list_head *wait_list = (dpolicy->type == DPOLICY_FSTRIM) ?
> > >  					&(dcc->fstrim_list) : &(dcc->wait_list);
> > > -	int flag = dpolicy->sync ? REQ_SYNC : 0;
> > > +	int flag;
> > >  	block_t lstart, start, len, total_len;
> > >  	int err = 0;
> > >  
> > > +	flag = dpolicy->sync ? REQ_SYNC : 0;
> > > +	flag |= dpolicy->type == DPOLICY_UMOUNT ? REQ_NOWAIT : 0;
> > > +
> > >  	if (dc->state != D_PREP)
> > >  		return 0;
> > >  
> > > @@ -1203,6 +1206,11 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
> > >  		bio->bi_end_io = f2fs_submit_discard_endio;
> > >  		bio->bi_opf |= flag;
> > >  		submit_bio(bio);
> > > +		if ((flag & REQ_NOWAIT) && (dc->error == -EAGAIN)) {
> > > +			dc->state = D_PREP;
> > > +			err = dc->error;
> > > +			break;
> > > +		}
> > >  
> > >  		atomic_inc(&dcc->issued_discard);
> > >  
> > > @@ -1510,6 +1518,10 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
> > >  			}
> > >  
> > >  			__submit_discard_cmd(sbi, dpolicy, dc, &issued);
> > > +			if (dc->error == -EAGAIN) {
> > > +				congestion_wait(BLK_RW_ASYNC, HZ/50);
> > 
> > 						--> need to be DEFAULT_IO_TIMEOUT
> 
> Yes, i will update it.
> 
> > 
> > > +				__relocate_discard_cmd(dcc, dc);
> > 
> > It seems we need to submit bio first, and then move dc to wait_list, if there's
> > no error, in __submit_discard_cmd().
> 
> Yes, that is not changed and it still happens for the failed request
> that is re-queued here too when it gets submitted again later.
> 
> I am requeuing the discard request failed with -EAGAIN error back to 
> dcc->pend_list[] from wait_list. It will call submit_bio() for this request
> and also move to wait_list when it calls __submit_discard_cmd() again next
> time. Please let me know if I am missing anything?

This patch has no problem, but I'm thinking that __submit_discard_cmd() needs
to return with any values by assumption where the waiting list should have
submitted commands.

> 
> Thanks,
> 
> > 
> > > +			}
> > >  
> > >  			if (issued >= dpolicy->max_requests)
> > >  				break;
> > > -- 
> > > Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
> > > Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
> -- 
> --
> Sent by a consultant of the Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
