Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E89A84197B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2019 02:36:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1harFO-0000zy-4F; Wed, 12 Jun 2019 00:36:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>)
 id 1harFM-0000zX-Ah; Wed, 12 Jun 2019 00:36:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9gKawnpnm3eYTlbJSmpS31BgWCZu6yO6zvRDwLNExMc=; b=jPwxmPjvRJZI/Ug89NjIItK41r
 WfnSor/J9xquS06gd+Q4HGb3GsXhPR403ZpkQZrZpXmRQlmXC38f/r1w+JI3mJf5bei7DIPgqFNpI
 rornkXEMMlYJnov6XKgT0b1mf4s9Uad9zbJsg4WrUPCJiVFrkABFIlPAVm+fBn/WPoOE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9gKawnpnm3eYTlbJSmpS31BgWCZu6yO6zvRDwLNExMc=; b=JqGMEUA6oxN7He30H9OQYqzjwZ
 8yido6ZVkOX6CMKB9Vkubk6s1xGhDTX8Ous9yWaYHC0yTTpUC8SqJ1R8frrI/MV5DyyGgnAvSH/xa
 QAZnrlStb4pM0atOicLgCQazGUc5tiQY3kJgy5YKFNP5IjOV/OjarRifk9i1DKnK7UCE=;
Received: from userp2130.oracle.com ([156.151.31.86])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1harFL-008glE-SF; Wed, 12 Jun 2019 00:36:13 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5C0U2aL172563;
 Wed, 12 Jun 2019 00:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=9gKawnpnm3eYTlbJSmpS31BgWCZu6yO6zvRDwLNExMc=;
 b=vHQc7RiwFlRopnBcV6yXscL30ZNdwN/v/B17eINRtpQHvUvgM6epdVedyPbAKdmcBBV3
 cpQKUJvANpmF9rest4EECBPlFj+c/6FFyA1MB+Y7QHfaviX1SgktsC/OuLuEeHTjfJfn
 IHVrIivC0Er8GlXskbXJ6t5OZcUHTAMhyEJ0O8MOVdKDEgKTHfWtz59o9kiNq/kqTY6E
 4hAomBRtHJLX3EPEAvdgUe3wJJHguniVZBFYytUSwIeEiPqdsoMO2S6x/RCI4kCCEC8X
 5tzrNpCpeUTAjMu2i0Q0axAMVtIdwT/+kMGJyGR6ACAIOztQv/pzRx3K8FTZ+teYFImj 5Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2t04etrany-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2019 00:35:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5C0YsTE041414;
 Wed, 12 Jun 2019 00:35:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 2t1jphr047-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 12 Jun 2019 00:35:50 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5C0Zn8q043221;
 Wed, 12 Jun 2019 00:35:49 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2t1jphr042-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2019 00:35:49 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5C0ZfCm005680;
 Wed, 12 Jun 2019 00:35:41 GMT
Received: from localhost (/10.145.179.81)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 11 Jun 2019 17:35:41 -0700
Date: Tue, 11 Jun 2019 17:35:38 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Dave Kleikamp <dave.kleikamp@oracle.com>
Message-ID: <20190612003538.GW1871505@magnolia>
References: <156022833285.3227089.11990489625041926920.stgit@magnolia>
 <156022834076.3227089.14763553158562888103.stgit@magnolia>
 <fb974a33-2192-30ab-9f31-885c3796360b@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb974a33-2192-30ab-9f31-885c3796360b@oracle.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9285
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906120001
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1harFL-008glE-SF
Subject: Re: [f2fs-dev] [Jfs-discussion] [PATCH 1/4] vfs: create a generic
 checking function for FS_IOC_SETFLAGS
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
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-efi@vger.kernel.org, clm@fb.com, adilger.kernel@dilger.ca,
 ocfs2-devel@oss.oracle.com, matthew.garrett@nebula.com,
 linux-nilfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ext4@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 josef@toxicpanda.com, viro@zeniv.linux.org.uk, dsterba@suse.com,
 jaegeuk@kernel.org, tytso@mit.edu, ard.biesheuvel@linaro.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 11, 2019 at 08:41:06AM -0500, Dave Kleikamp wrote:
> On 6/10/19 11:45 PM, Darrick J. Wong wrote:
> > From: Darrick J. Wong <darrick.wong@oracle.com>
> > 
> > Create a generic checking function for the incoming FS_IOC_SETFLAGS flag
> > values so that we can standardize the implementations that follow ext4's
> > flag values.
> > 
> > Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> 
>  -- clip --
> 
> > diff --git a/fs/jfs/ioctl.c b/fs/jfs/ioctl.c
> > index ba34dae8bd9f..c8446d2cd0c7 100644
> > --- a/fs/jfs/ioctl.c
> > +++ b/fs/jfs/ioctl.c
> > @@ -98,6 +98,12 @@ long jfs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> >  		/* Lock against other parallel changes of flags */
> >  		inode_lock(inode);
> >  
> > +		oldflags = jfs_map_ext2(jfs_inode->mode2 & JFS_FL_USER_VISIBLE,
> > +					0);
> > +		err = vfs_ioc_setflags_check(inode, oldflags, flags);
> > +		if (err)
> > +			goto setflags_out;
> 
> inode_unlock(inode) is not called on the error path.
> 
> > +
> >  		oldflags = jfs_inode->mode2;
> >  
> >  		/*
> 
> This patch leaves jfs's open-coded version of the same check.

Heh, thanks for pointing that out.  I'll fix both of those things.

--D

> Thanks,
> Shaggy


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
