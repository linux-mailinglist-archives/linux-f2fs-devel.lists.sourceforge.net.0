Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70464509289
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Apr 2022 00:13:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhIZZ-00010L-K9; Wed, 20 Apr 2022 22:13:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <david@fromorbit.com>) id 1nhIZZ-00010F-5R
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 22:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FbfaHmm84Np4+rgvIc8ITNcvJdQTxKMAK5aykn818Gk=; b=OTDYtmoXgemNhIG5b8bNU2j+7e
 hVjm+maz34nnMBchUy7p4xgwaEQrzmDpkVqwxIQ17HC6unBKuEguLihACRcgiwbevWKgYu+baYY8z
 9U0NADyiQkc/KoChEaCWU2kMcL/brnSc4zX13VVNhbD3m4OhJMpRE4zGxkImN4CMDL+o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FbfaHmm84Np4+rgvIc8ITNcvJdQTxKMAK5aykn818Gk=; b=M2jhTtghQFHHpFjN7mZ9+/vUMH
 0MUf3Rfb7ANmnx5UoBvvTOwiowDz+idp6kWU8ZQTHVfTxlaxZOuAYjxNRu8N+wSvp03HgY+iBJdx3
 pqMGpK8qK0e2OEtaQ1zeCRE80e/rvvXT/Qq54LGGPYT14yWn/2YN/1zlzemuMridkI7Q=;
Received: from mail105.syd.optusnet.com.au ([211.29.132.249])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.94.2)
 id 1nhIZY-0052F3-NT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 22:13:17 +0000
Received: from dread.disaster.area (pa49-181-115-138.pa.nsw.optusnet.com.au
 [49.181.115.138])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id A37F310E5CE6;
 Thu, 21 Apr 2022 07:52:54 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1nhIFo-002XWU-OW; Thu, 21 Apr 2022 07:52:52 +1000
Date: Thu, 21 Apr 2022 07:52:52 +1000
From: Dave Chinner <david@fromorbit.com>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <20220420215252.GO1544202@dread.disaster.area>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <20220419140508.b6c4uit3u5hmdql4@wittgenstein>
 <625F6FE6.4010305@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <625F6FE6.4010305@fujitsu.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=VuxAv86n c=1 sm=1 tr=0 ts=626080b7
 a=/kVtbFzwtM2bJgxRVb+eeA==:117 a=/kVtbFzwtM2bJgxRVb+eeA==:17
 a=kj9zAlcOel0A:10 a=z0gMJWrwH1QA:10 a=omOdbC7AAAAA:8 a=VwQbUJbxAAAA:8
 a=7-415B0cAAAA:8 a=dB9dRndzBIRXieEivdAA:9 a=CjuIK1q_8ugA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 20, 2022 at 01:27:39AM +0000,
 xuyang2018.jy@fujitsu.com
 wrote: > on 2022/4/19 22:05, Christian Brauner wrote: > > On Tue, Apr 19,
 2022 at 07:47:07PM +0800, Yang Xu wrote: > >> This has no [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [211.29.132.249 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1nhIZY-0052F3-NT
Subject: Re: [f2fs-dev] [PATCH v4 1/8] fs: move sgid strip operation from
 inode_init_owner into inode_sgid_strip
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
Cc: Christian Brauner <brauner@kernel.org>,
 "djwong@kernel.org" <djwong@kernel.org>,
 "jlayton@kernel.org" <jlayton@kernel.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 20, 2022 at 01:27:39AM +0000, xuyang2018.jy@fujitsu.com wrote:
> on 2022/4/19 22:05, Christian Brauner wrote:
> > On Tue, Apr 19, 2022 at 07:47:07PM +0800, Yang Xu wrote:
> >> This has no functional change. Just create and export inode_sgid_strip api for
> >> the subsequent patch. This function is used to strip S_ISGID mode when init
> >> a new inode.
> >>
> >> Acked-by: Christian Brauner (Microsoft)<brauner@kernel.org>
> >> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
> >> ---
> >>   fs/inode.c         | 22 ++++++++++++++++++----
> >>   include/linux/fs.h |  3 ++-
> >>   2 files changed, 20 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/fs/inode.c b/fs/inode.c
> >> index 9d9b422504d1..3215e61a0021 100644
> >> --- a/fs/inode.c
> >> +++ b/fs/inode.c
> >> @@ -2246,10 +2246,8 @@ void inode_init_owner(struct user_namespace *mnt_userns, struct inode *inode,
> >>   		/* Directories are special, and always inherit S_ISGID */
> >>   		if (S_ISDIR(mode))
> >>   			mode |= S_ISGID;
> >> -		else if ((mode&  (S_ISGID | S_IXGRP)) == (S_ISGID | S_IXGRP)&&
> >> -			 !in_group_p(i_gid_into_mnt(mnt_userns, dir))&&
> >> -			 !capable_wrt_inode_uidgid(mnt_userns, dir, CAP_FSETID))
> >> -			mode&= ~S_ISGID;
> >> +		else
> >> +			inode_sgid_strip(mnt_userns, dir,&mode);
> >>   	} else
> >>   		inode_fsgid_set(inode, mnt_userns);
> >>   	inode->i_mode = mode;
> >> @@ -2405,3 +2403,19 @@ struct timespec64 current_time(struct inode *inode)
> >>   	return timestamp_truncate(now, inode);
> >>   }
> >>   EXPORT_SYMBOL(current_time);
> >> +
> >> +void inode_sgid_strip(struct user_namespace *mnt_userns,
> >> +		      const struct inode *dir, umode_t *mode)
> >> +{
> >
> > I think with Willy agreeing in an earlier version with me and you
> > needing to resend anyway I'd say have this return umode_t instead of
> > passing a pointer.
> 
> IMO, I am fine with your and Willy way. But I need a reason otherwise
> I can't convince myself why not use mode pointer directly.

You should listen to experienced developers like Willy and Christian
when they say "follow existing coding conventions".  Indeed, Darrick
has also mentioned he'd prefer it to return the new mode, and I'd
also prefer that it returns the new mode.

> I have asked you and Willy before why return umode_t value is better, 
> why not modify mode pointer directly? Since we have use mode as 
> argument, why not modify mode pointer directly in function?

If the function had mulitple return status (e.g. an error or a mode)
the convention is to pass the mode output variable by reference and
return the error status. But there is only one return value from
this function - the mode - and hence it should be returned in the
return value, not passed by reference.

Passing by reference unnecessarily makes the code more complex and
less mainatainable.  Code that returns a single value is easy to
understand, is more flexible in the way callers can use it and it's
simpler to maintain.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
