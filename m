Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCBF2AF98
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 May 2019 09:55:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hVATo-0008Kb-LL; Mon, 27 May 2019 07:55:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hVATn-0008KO-9k
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 May 2019 07:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hD9S7Zgp3cdyjfBrhi7dx0CM7RY08dyB6Ed6eWthzO4=; b=V7Kkzrvk0HNGk3bSTTmdBvoBIm
 bHdEysB1z6BUARWAGVnPSwN2yg5ylT0HJjDLk67+uo5IiJ9gV7cNKDqo3aVI2CQUohkjNePCux0x/
 8afHWQtrH8oiV4EL/Z0jcu7dvMnwf1NvjaPXmNRgmx8NsETJssijs0lXZajFmtWnCfjI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hD9S7Zgp3cdyjfBrhi7dx0CM7RY08dyB6Ed6eWthzO4=; b=Ka2scArW8HcRUl2dozbcqaogsn
 ajOInROA766LPp2pWREd+YQtSUXe6QB0OyoG4o1FNMG79LHWHa/3FYtKt9uQ0plnUcxUq/slOxHz2
 kUJccSCsHb+MlMjy7qL2CXMbx9+PK+g5ZQGtrmLboDYsR1fBT4ospAB+rSWEUhyRQBxA=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hVATl-00EeUR-1I
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 May 2019 07:55:35 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id EC5C66086B; Mon, 27 May 2019 07:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558943724;
 bh=TLgwZBRAFLM5rcutPPk68tE3qitbgmeVGUN16gHE3Cs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PcjSgTSMk6k0NRJHID31m2lCvEYJp4utLdfT/RB2lkk+4R8xyEppv9Ykv3wd4Lz72
 S11iKnrKuQWXlDXA6yd8KLsBZf3Z+v/53AXt/awuinTgFTCb5phAN64zBOPsAqdwzC
 XfMXAVYWqVssBxgLAMyUXI7En8MKyBNY3ayQiHcw=
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B58B6086B;
 Mon, 27 May 2019 07:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558943724;
 bh=TLgwZBRAFLM5rcutPPk68tE3qitbgmeVGUN16gHE3Cs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PcjSgTSMk6k0NRJHID31m2lCvEYJp4utLdfT/RB2lkk+4R8xyEppv9Ykv3wd4Lz72
 S11iKnrKuQWXlDXA6yd8KLsBZf3Z+v/53AXt/awuinTgFTCb5phAN64zBOPsAqdwzC
 XfMXAVYWqVssBxgLAMyUXI7En8MKyBNY3ayQiHcw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3B58B6086B
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Mon, 27 May 2019 13:25:18 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <chao@kernel.org>, Yunlei He <heyunlei@huawei.com>
Message-ID: <20190527075518.GD10043@codeaurora.org>
References: <1558694631-12481-1-git-send-email-stummala@codeaurora.org>
 <6a4ce8cb-d9ec-1923-8304-6b8956283e85@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a4ce8cb-d9ec-1923-8304-6b8956283e85@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hVATl-00EeUR-1I
Subject: Re: [f2fs-dev] [PATCH] f2fs: add errors=panic mount option
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 24, 2019 at 08:13:50PM +0800, Chao Yu wrote:
> On 2019-5-24 18:43, Sahitya Tummala wrote:
> > Add errors=panic mount option for debugging purpose. It can be
> > set dynamically when the config option CONFIG_F2FS_CHECK_FS
> > is not enabled.
> 
> Sahitya,
> 
> I remember Yunlei has a similar patch for this, could you rebase your code on
> that patch, if Yunlei agrees, we can add Signed-off of him.
> 

Hi Chao,

Sure, I can combine both the patches as they are providing different functionalities
with the same mount option.

Hi Yunlei,

Are you okay with this merging? Please confirm.
If yes, then I will make it into one patch and add your signed-off.

Thanks,

> FYI
> 
> https://sourceforge.net/p/linux-f2fs/mailman/linux-f2fs-devel/thread/f6a0b1c3-4057-8b64-a419-4b2914d48394%40kernel.org/#msg36376331
> 
> Thanks,
> 
> > 
> > Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > ---
> >  fs/f2fs/f2fs.h  |  9 +++++++--
> >  fs/f2fs/super.c | 21 +++++++++++++++++++++
> >  2 files changed, 28 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 9b3d997..95adedb 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -32,8 +32,12 @@
> >  #define f2fs_bug_on(sbi, condition)					\
> >  	do {								\
> >  		if (unlikely(condition)) {				\
> > -			WARN_ON(1);					\
> > -			set_sbi_flag(sbi, SBI_NEED_FSCK);		\
> > +			if (test_opt(sbi, ERRORS_PANIC)) {		\
> > +				BUG_ON(condition);			\
> > +			} else {					\
> > +				WARN_ON(1);				\
> > +				set_sbi_flag(sbi, SBI_NEED_FSCK);	\
> > +			}						\
> >  		}							\
> >  	} while (0)
> >  #endif
> > @@ -99,6 +103,7 @@ struct f2fs_fault_info {
> >  #define F2FS_MOUNT_INLINE_XATTR_SIZE	0x00800000
> >  #define F2FS_MOUNT_RESERVE_ROOT		0x01000000
> >  #define F2FS_MOUNT_DISABLE_CHECKPOINT	0x02000000
> > +#define F2FS_MOUNT_ERRORS_PANIC		0x04000000
> >  
> >  #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
> >  #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 912e261..7d6d96a 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -137,6 +137,7 @@ enum {
> >  	Opt_fsync,
> >  	Opt_test_dummy_encryption,
> >  	Opt_checkpoint,
> > +	Opt_errors,
> >  	Opt_err,
> >  };
> >  
> > @@ -196,6 +197,7 @@ enum {
> >  	{Opt_fsync, "fsync_mode=%s"},
> >  	{Opt_test_dummy_encryption, "test_dummy_encryption"},
> >  	{Opt_checkpoint, "checkpoint=%s"},
> > +	{Opt_errors, "errors=%s"},
> >  	{Opt_err, NULL},
> >  };
> >  
> > @@ -788,6 +790,23 @@ static int parse_options(struct super_block *sb, char *options)
> >  			}
> >  			kvfree(name);
> >  			break;
> > +		case Opt_errors:
> > +#ifndef CONFIG_F2FS_CHECK_FS
> > +			name = match_strdup(&args[0]);
> > +			if (!name)
> > +				return -ENOMEM;
> > +
> > +			if (strlen(name) == 5 && !strncmp(name, "panic", 5)) {
> > +				set_opt(sbi, ERRORS_PANIC);
> > +			} else {
> > +				kvfree(name);
> > +				return -EINVAL;
> > +			}
> > +			kvfree(name);
> > +			f2fs_msg(sb, KERN_INFO,
> > +				"debug mode errors=panic enabled\n");
> > +#endif
> > +			break;
> >  		default:
> >  			f2fs_msg(sb, KERN_ERR,
> >  				"Unrecognized mount option \"%s\" or missing value",
> > @@ -1417,6 +1436,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
> >  		seq_printf(seq, ",fsync_mode=%s", "strict");
> >  	else if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_NOBARRIER)
> >  		seq_printf(seq, ",fsync_mode=%s", "nobarrier");
> > +	if (test_opt(sbi, ERRORS_PANIC))
> > +		seq_printf(seq, ",errors=%s", "panic");
> >  	return 0;
> >  }
> >  
> > 

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
