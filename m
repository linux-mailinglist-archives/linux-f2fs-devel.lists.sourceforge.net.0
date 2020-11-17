Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 975FD2B6B9F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 18:24:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kf4i7-0007ri-6A; Tue, 17 Nov 2020 17:24:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1kf4hO-0007ot-OE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 17:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lCI0j81S3i0woS5Vx28EWN/Xr3iRPfZ2DQ1EVZE5Cgs=; b=klzPnsLA0t1YFtuzHG7S8SnGZS
 pitYXfXnkIDOwDJqVppvneiUbJprxcPmVO++X1m0T0SPBAvrbLBkwME0fGeGR3uMEP7zNCz9Tvfii
 ldx8+PPpz6ZcaI6PWiKwSsRmw4VfDRiKesMrFMiPfG1oDoAKvOAneNi5ie1HJqeb21p8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lCI0j81S3i0woS5Vx28EWN/Xr3iRPfZ2DQ1EVZE5Cgs=; b=QdHGjQv8MIwllzFUuwG6W8K5QT
 o+FxS3/+bj0OXwMzA5dyfRsO+LI3UeE0f5Nd2HMlYORmpf9Q9OGu2Al4s9FGrZOLqBXwoMWVi7ZYD
 A8gRbIrG8D0zsJZ/UR9Xwd5PbcJ/XF7YjteHucJz+4rReB4wDE7C1/Lh2lv/V6hvpD7I=;
Received: from userp2120.oracle.com ([156.151.31.85])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kf4hJ-001BfG-0d
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 17:23:22 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AHHJeh4023927;
 Tue, 17 Nov 2020 17:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=lCI0j81S3i0woS5Vx28EWN/Xr3iRPfZ2DQ1EVZE5Cgs=;
 b=TQtpJOnZ048mOORXEp80yzCfzAhgyaSQ254isK3CPo681k6c4mTVs3Eu5Q5Nt/CqLKBn
 0m8xjVNxqgQtuGDmGCP50G4ciqsK/k+HEsAkHQubbX6i6Msma/zD+9XHmV00r+97YSRW
 mQco7AJenksEjDQuToVpSpu/drlfqQtBi4b+8VOHwl1KQwxHys1ZCf53qZYZw9BKVnNS
 g77NlDdwuPIKLaSl+tX3R5AmyAseaz4DQ7hT+J/0PFQQhlTvwfb1SBIZavOzDTBj39mb
 AIcwTU61AYY3FD9KelpEu5VIA3YQV4ysq8TLhF/Nk/Q9pfTPAmG2i0vlvFp4691H0dZD 4A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 34t7vn3rpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Nov 2020 17:23:01 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AHHJTfO091668;
 Tue, 17 Nov 2020 17:21:01 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 34ts0r6huu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 17:21:01 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AHHKxmJ011967;
 Tue, 17 Nov 2020 17:20:59 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 17 Nov 2020 09:20:58 -0800
Date: Tue, 17 Nov 2020 09:20:56 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20201117172056.GW9695@magnolia>
References: <20201117140708.1068688-1-satyat@google.com>
 <20201117171526.GD445084@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117171526.GD445084@mit.edu>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9808
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 bulkscore=0 suspectscore=1 spamscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170125
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9808
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=1
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011170125
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [156.151.31.85 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kf4hJ-001BfG-0d
Subject: Re: [f2fs-dev] [PATCH v7 0/8] add support for direct I/O with
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
 Satya Tangirala <satyat@google.com>, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 17, 2020 at 12:15:26PM -0500, Theodore Y. Ts'o wrote:
> What is the expected use case for Direct I/O using fscrypt?  This
> isn't a problem which is unique to fscrypt, but one of the really
> unfortunate aspects of the DIO interface is the silent fallback to
> buffered I/O.  We've lived with this because DIO goes back decades,
> and the original use case was to keep enterprise databases happy, and
> the rules around what is necessary for DIO to work was relatively well
> understood.
> 
> But with fscrypt, there's going to be some additional requirements
> (e.g., using inline crypto) required or else DIO silently fall back to
> buffered I/O for encrypted files.  Depending on the intended use case
> of DIO with fscrypt, this caveat might or might not be unfortunately
> surprising for applications.
> 
> I wonder if we should have some kind of interface so we can more
> explicitly allow applications to query exactly what the requirements
> might be for a particular file vis-a-vis Direct I/O.  What are the
> memory alignment requirements, what are the file offset alignment
> requirements, what are the write size requirements, for a particular
> file.

In Ye Olde days there was XFS_IOC_DIOINFO to communicate all that (xfs
hardcodes 512b file offset alignment), but in this modern era perhaps
it's time to shovel that into statx...

--D

> 
> 						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
