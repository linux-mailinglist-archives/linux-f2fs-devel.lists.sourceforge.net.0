Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7840B555AD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2019 19:17:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hfp3s-0004Jr-8d; Tue, 25 Jun 2019 17:16:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>)
 id 1hfp3q-0004JP-Gf; Tue, 25 Jun 2019 17:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8YOHqT1H5m87NYapYKi5uOloFdOjAQsayzwyn6FBGsU=; b=OquYyW5iScSXiCWFcloebgR3ej
 4c1/cIMEE6IB4pFV11EJJfX1CK0BW3eA6tRh7afMEBtlLbinaUy5CP9Ti/QjLqhrBLP0eoQhS08ir
 x1UqyF1YzYwMdK287tRxPVpQqg+opjOg+X7B2L853FjnvAyHu6EgF9/S3ibuoPL5h4Pc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8YOHqT1H5m87NYapYKi5uOloFdOjAQsayzwyn6FBGsU=; b=QGv0A1wi6T/uIObw2TmnZaXO2j
 V2MsBDq4WsY0k1t0ob4TFtmrmT6bF2n8+mghX3MaA+7aYQThUptPt1f+iHHenYLdjj6Kup74lK8Bw
 aJNyT/1+IeRo5bXCpC8mfBzd75GCxELYbBZrO4gkqzzNK5TBLX7XUNDBmIW52sWG1bF0=;
Received: from userp2130.oracle.com ([156.151.31.86])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hfp3z-00DOYx-5V; Tue, 25 Jun 2019 17:17:01 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PHDjnK112356;
 Tue, 25 Jun 2019 17:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=8YOHqT1H5m87NYapYKi5uOloFdOjAQsayzwyn6FBGsU=;
 b=kRLzMzcD4dDTxKKrIatPNQ8UbCC6dJVjee0v4WI+ASaqAGwEtXxAYgVRxpW7bi2F0kdN
 +8BkhOTIe/oZhPnAYc1tUS8V4kAmfxQ6VRRo827Ml89rmcehwrL0IvipIkWsyxIORYzM
 dFZwu3TFJ2jAetMYP79ISwOmGkO6y3D31aAPNJXhXBih2Gr5GYQy3VEltfIlToeYcYTA
 OPEtp5J5s9kqXfLt+XUPAuzKiT8ERVsbjZlleEopgqvRqrrBmDlDLaWMStCqCoAydaCU
 P+tj3IggCOnLZs/3nlNDQyjq5pVdz1NFvQtV5k0sEbhsON1T5kYdVRGZQlOdlAbybMLW JQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2t9brt5t2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 17:16:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PHFVC3141059;
 Tue, 25 Jun 2019 17:16:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 2t9acc7vvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 25 Jun 2019 17:16:23 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5PHGMB9143216;
 Tue, 25 Jun 2019 17:16:22 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2t9acc7vvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 17:16:22 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5PHGJxo007776;
 Tue, 25 Jun 2019 17:16:19 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 25 Jun 2019 10:16:19 -0700
Date: Tue, 25 Jun 2019 10:16:16 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: dsterba@suse.cz, Christoph Hellwig <hch@infradead.org>,
 matthew.garrett@nebula.com, yuchao0@huawei.com, tytso@mit.edu,
 shaggy@kernel.org, ard.biesheuvel@linaro.org, josef@toxicpanda.com,
 clm@fb.com, adilger.kernel@dilger.ca, jk@ozlabs.org, jack@suse.com,
 dsterba@suse.com, jaegeuk@kernel.org, viro@zeniv.linux.org.uk,
 cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
 linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
 reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Message-ID: <20190625171616.GB2230847@magnolia>
References: <156116136742.1664814.17093419199766834123.stgit@magnolia>
 <156116138952.1664814.16552129914959122837.stgit@magnolia>
 <20190625105725.GB26085@infradead.org>
 <20190625170248.GS8917@twin.jikos.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625170248.GS8917@twin.jikos.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9299
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250130
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hfp3z-00DOYx-5V
Subject: Re: [f2fs-dev] [PATCH 2/4] vfs: create a generic checking function
 for FS_IOC_FSSETXATTR
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 25, 2019 at 07:02:48PM +0200, David Sterba wrote:
> On Tue, Jun 25, 2019 at 03:57:25AM -0700, Christoph Hellwig wrote:
> > On Fri, Jun 21, 2019 at 04:56:29PM -0700, Darrick J. Wong wrote:
> > > From: Darrick J. Wong <darrick.wong@oracle.com>
> > > 
> > > Create a generic checking function for the incoming FS_IOC_FSSETXATTR
> > > fsxattr values so that we can standardize some of the implementation
> > > behaviors.
> > > 
> > > Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> > > Reviewed-by: Jan Kara <jack@suse.cz>
> > > ---
> > >  fs/btrfs/ioctl.c   |   21 +++++++++-------
> > >  fs/ext4/ioctl.c    |   27 ++++++++++++++------
> > >  fs/f2fs/file.c     |   26 ++++++++++++++-----
> > >  fs/inode.c         |   17 +++++++++++++
> > >  fs/xfs/xfs_ioctl.c |   70 ++++++++++++++++++++++++++++++----------------------
> > >  include/linux/fs.h |    3 ++
> > >  6 files changed, 111 insertions(+), 53 deletions(-)
> > > 
> > > 
> > > diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> > > index f408aa93b0cf..7ddda5b4b6a6 100644
> > > --- a/fs/btrfs/ioctl.c
> > > +++ b/fs/btrfs/ioctl.c
> > > @@ -366,6 +366,13 @@ static int check_xflags(unsigned int flags)
> > >  	return 0;
> > >  }
> > >  
> > > +static void __btrfs_ioctl_fsgetxattr(struct btrfs_inode *binode,
> > > +				     struct fsxattr *fa)
> > > +{
> > > +	memset(fa, 0, sizeof(*fa));
> > > +	fa->fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags);
> > 
> > Is there really much of a point in this helper? Epeciall as
> > the zeroing could easily be done in the variable declaration
> > line using
> > 
> > 	struct fsxattr fa = { };
> 
> Agreed, not counting the initialization the wrapper is merely another
> name for btrfs_inode_flags_to_xflags. I also find it slightly confusing
> that __btrfs_ioctl_fsgetxattr name is too close to the ioctl callback
> implementation btrfs_ioctl_fsgetxattr but only does some initialization.

Ok; it's easily enough changed to:

	struct fsxattr old_fa = {
		.fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags),
	};

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
