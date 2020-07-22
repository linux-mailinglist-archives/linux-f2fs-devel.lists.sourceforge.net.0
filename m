Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D5E22A324
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jul 2020 01:33:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyOEe-0004ee-J9; Wed, 22 Jul 2020 23:33:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1jyOEd-0004eU-0e
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 23:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fWpKHgNPZOAzReYr9aant2+0a0UeEh3JZp16QVU89XY=; b=jYga+CBeamf7ejx7FIBjOu712V
 rU3ByKiFWIk5eYyImNQFWs01H6q6odjLSqCHguslpVTkv81JTG4VF1kgLWCwke/znRJ7gPCqRNWJJ
 R617s/+zE7wtsQjO6AsJPUf/N0wlhy5oz+p3D4w3EpEAxNT11hKrUQixONv49yKReebM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fWpKHgNPZOAzReYr9aant2+0a0UeEh3JZp16QVU89XY=; b=kgJ7RcmNcqjxjwHvbO7BwAXOQs
 AuuNhncmX1J6rpvjX8iTbAJM0UOfEB7GbM6+S+Dq5W6rfuuwPHqHm6vkO5AXUgBNdbsKYAxn4Tbqm
 I54UTGpDFMXYmKivwygdorMlfW7SU40klnHBbg2a4dxMCCSmQcQr/vfybjkAVxkZuhOY=;
Received: from userp2120.oracle.com ([156.151.31.85])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyOEb-005Vz4-PD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 23:33:14 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06MNWDup102917;
 Wed, 22 Jul 2020 23:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=fWpKHgNPZOAzReYr9aant2+0a0UeEh3JZp16QVU89XY=;
 b=vdr4txccZwuqQb8Tv6CDYoYysjRLXjznmFk2R5DukOPaE6xrhaVV1qrXEnKcB+30c5vb
 /K6F+pXY9O0Z1xLuxUUj6I1vcXvDf825U53YqS6zhUNzJDVmMHqDWUWhkGdVpq6cbbyJ
 3wjIfv2+REUS6HTYDp/GlGBFAwSeMan4HyDcyJNNsco7oIPvE66mFYnvC8nSD7zkmvtG
 G5I6/U0DbCMhztLf/1UYFtWPNfFQlPlZCGQH97w5I4o4p5ZY8x2HDWIVkgVhJOYPTqPZ
 KpoO6T7pbNc6t/PNk1ujmxlhl0p2KJ5HrxUldLiUomEbo0b5r6Wj9GBlr7sXMpXOQo5c RQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 32d6kstfje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 22 Jul 2020 23:32:52 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06MNSHd3141631;
 Wed, 22 Jul 2020 23:32:51 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 32exwvs14e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 23:32:51 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06MNWnxQ030536;
 Wed, 22 Jul 2020 23:32:49 GMT
Received: from localhost (/10.159.241.198)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 22 Jul 2020 23:32:48 +0000
Date: Wed, 22 Jul 2020 16:32:47 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200722233247.GO3151642@magnolia>
References: <20200720233739.824943-1-satyat@google.com>
 <20200720233739.824943-4-satyat@google.com>
 <20200722211629.GE2005@dread.disaster.area>
 <20200722223404.GA76479@sol.localdomain>
 <20200722232625.GB83434@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722232625.GB83434@sol.localdomain>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9690
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 suspectscore=1
 bulkscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220145
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9690
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=1
 bulkscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220146
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [156.151.31.85 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyOEb-005Vz4-PD
Subject: Re: [f2fs-dev] [PATCH v4 3/7] iomap: support direct I/O with
 fscrypt using blk-crypto
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
Cc: Satya Tangirala <satyat@google.com>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 22, 2020 at 04:26:25PM -0700, Eric Biggers wrote:
> On Wed, Jul 22, 2020 at 03:34:04PM -0700, Eric Biggers wrote:
> > So, something like this:
> > =

> > diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> > index 44bad4bb8831..2816194db46c 100644
> > --- a/fs/ext4/inode.c
> > +++ b/fs/ext4/inode.c
> > @@ -3437,6 +3437,15 @@ static int ext4_iomap_begin(struct inode *inode,=
 loff_t offset, loff_t length,
> >  	map.m_len =3D min_t(loff_t, (offset + length - 1) >> blkbits,
> >  			  EXT4_MAX_LOGICAL_BLOCK) - map.m_lblk + 1;
> >  =

> > +	/*
> > +	 * When inline encryption is enabled, sometimes I/O to an encrypted f=
ile
> > +	 * has to be broken up to guarantee DUN contiguity.  Handle this by
> > +	 * limiting the length of the mapping returned.
> > +	 */
> > +	if (!(flags & IOMAP_REPORT))
> > +		map.m_len =3D fscrypt_limit_io_blocks(inode, map.m_lblk,
> > +						    map.m_len);
> > +
> >  	if (flags & IOMAP_WRITE)
> >  		ret =3D ext4_iomap_alloc(inode, &map, flags);
> >  	else
> > =

> > =

> > That also avoids any confusion between pages and blocks, which is nice.
> =

> Correction: for fiemap, ext4 actually uses ext4_iomap_begin_report() inst=
ead of
> ext4_iomap_begin().  So we don't need to check for !IOMAP_REPORT.
> =

> Also it could make sense to limit map.m_len after ext4_iomap_alloc() rath=
er than
> before, so that we don't limit the length of the extent that gets allocat=
ed but
> rather just the length that gets returned to iomap.

Na=EFve question here -- if the decision to truncate the bio depends on
the file block offset, can you achieve the same thing by capping the
length of the iovec prior to iomap_dio_rw?

Granted that probably only makes sense if the LBLK IV thing is only
supposed to be used infrequently, and having to opencode a silly loop
might be more hassle than it's worth...

--D

> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
