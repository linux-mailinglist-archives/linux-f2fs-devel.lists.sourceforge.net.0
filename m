Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA8B52376
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2019 08:23:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hferN-0007yX-JU; Tue, 25 Jun 2019 06:23:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chandan@linux.ibm.com>) id 1hferM-0007yJ-8b
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jun 2019 06:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AeWT+QJYQAj67mvyUkRD5fTJOqupycYJkPe+OwN3GMM=; b=FUYkpVZ4ooLrMOqDOP/beX5yFX
 ZatQHWwsoh4qA3rcyXUElsXE+CNBkpIKLTMltEy8f373JBqdl7KTr7lK9nfXglrjJeD3xh9PkckdP
 J+fA5zNgi7X3NhRAC3fcvBrmXWEPq6DcxINCkyDFvH1ar/epZxVHKQBCgBk8xZwD8qII=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:References
 :In-Reply-To:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AeWT+QJYQAj67mvyUkRD5fTJOqupycYJkPe+OwN3GMM=; b=WMFsDG+vprhvChCqrwi4TAzP3a
 eJc5ZqLjgTsbu5vQWDBzXcz3r16Qpd6DHUXJgJPV0gCgcixzPOKyViK7EAKqmegvDtWrHNHLaT0ZU
 M/EjfwXlnPKHY4a/aXTsx1E6yjWH1res2YRRzRh9AmCDuVg4aP9SlfWCXPTIYeSlGGtw=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hferU-00CiMZ-DF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jun 2019 06:23:26 +0000
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P6H7kV098185
 for <linux-f2fs-devel@lists.sourceforge.net>; Tue, 25 Jun 2019 02:23:18 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tbe0h8pt8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>; Tue, 25 Jun 2019 02:23:18 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-f2fs-devel@lists.sourceforge.net> from <chandan@linux.ibm.com>;
 Tue, 25 Jun 2019 07:23:16 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 07:23:11 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5P6NA8M37421188
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 06:23:11 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4137AE057;
 Tue, 25 Jun 2019 06:23:10 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22F32AE053;
 Tue, 25 Jun 2019 06:23:09 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.124.35.58])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 06:23:08 +0000 (GMT)
From: Chandan Rajendra <chandan@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Date: Tue, 25 Jun 2019 11:54:18 +0530
Organization: IBM
In-Reply-To: <20190621221550.GF167064@gmail.com>
References: <20190616160813.24464-1-chandan@linux.ibm.com>
 <20190621221550.GF167064@gmail.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19062506-0028-0000-0000-0000037D4CB7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062506-0029-0000-0000-0000243D6CB7
Message-Id: <1680442.JJIz71cjaA@localhost.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250050
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hferU-00CiMZ-DF
Subject: Re: [f2fs-dev] [PATCH V3 0/7] Consolidate FS read I/O callbacks code
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 linux-fscrypt@vger.kernel.org, adilger.kernel@dilger.ca,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Saturday, June 22, 2019 3:45:51 AM IST Eric Biggers wrote:
> On Sun, Jun 16, 2019 at 09:38:06PM +0530, Chandan Rajendra wrote:
> > This patchset moves the "FS read I/O callbacks" code into a file of its
> > own (i.e. fs/read_callbacks.c) and modifies the generic
> > do_mpage_readpge() to make use of the functionality provided.
> > 
> > "FS read I/O callbacks" code implements the state machine that needs
> > to be executed after reading data from files that are encrypted and/or
> > have verity metadata associated with them.
> > 
> > With these changes in place, the patchset changes Ext4 to use
> > mpage_readpage[s] instead of its own custom ext4_readpage[s]()
> > functions. This is done to reduce duplication of code across
> > filesystems. Also, "FS read I/O callbacks" source files will be built
> > only if CONFIG_FS_ENCRYPTION is enabled.
> > 
> > The patchset also modifies fs/buffer.c to get file
> > encryption/decryption to work with subpage-sized blocks.
> > 
> > The patches can also be obtained from
> > https://github.com/chandanr/linux.git at branch subpage-encryption-v3.
> > 
> 
> FWIW: while doing my review I put together an (untested) incremental patch that
> addresses my comments on the code, so I've provided it below in case you want to
> start with it when addressing my comments.
> 
> This is just a single diff against your subpage-encryption-v3 branch, so of
> course it would still need to be folded into the appropriate patches.  Also see
> my suggestions in reply to patch 2 about how to better organize the series.  I
> also left TODOs in kerneldoc comments that still need to be updated.
> 

Thanks for all your help. I will post the next version of the patchset
addressing all your review comments.

-- 
chandan





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
