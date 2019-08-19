Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0809250B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Aug 2019 15:32:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzhlT-0000Dh-UC; Mon, 19 Aug 2019 13:32:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chandan@linux.ibm.com>) id 1hzhlS-0000DO-1v
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Aug 2019 13:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X+0QZWsGGSUpi75JEBTjkLf/4Kv3eae4E/kzkG/Syc0=; b=AdFskC4SvkZEH6mJUwROrBdZX/
 XxJSo00l0ehL/oB3PDBW5zVoI/UjQhwIZkXiW904JtKFTwXSBUi8hhR7fVN6phdj04Xlrxf452tsF
 zQDq0qU/aCyAtVThZtmz/FrmwwAW3lL1RdQ8hevV/+zANCp3/IDwiy1M9/9imktMdzQE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:References
 :In-Reply-To:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X+0QZWsGGSUpi75JEBTjkLf/4Kv3eae4E/kzkG/Syc0=; b=STBCuY4eTGAgHLf+gGg0fuo7MX
 SsYJQbWC2TyCBNq1v3Fv4vf5LYm4Wez5cGm545O8EIDzgYI7Dp0o+7Jod9eeP2cSkRmOOBtscqWzl
 d7rQfWUAnib6IEY1wI3YhhQy8wJ2JhZoLua8GCKJd4weII0R1TROBDapamT3hZcs+QP8=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzhlO-008m1M-Nc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Aug 2019 13:32:01 +0000
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7JDTnuj137909
 for <linux-f2fs-devel@lists.sourceforge.net>; Mon, 19 Aug 2019 09:31:52 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ufu10chcp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>; Mon, 19 Aug 2019 09:31:52 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-f2fs-devel@lists.sourceforge.net> from <chandan@linux.ibm.com>;
 Mon, 19 Aug 2019 14:31:50 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 19 Aug 2019 14:31:46 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7JDVjd655574772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Aug 2019 13:31:45 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00B214C040;
 Mon, 19 Aug 2019 13:31:45 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 804964C044;
 Mon, 19 Aug 2019 13:31:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.69.146])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 19 Aug 2019 13:31:42 +0000 (GMT)
From: Chandan Rajendra <chandan@linux.ibm.com>
To: Chao Yu <chao@kernel.org>
Date: Mon, 19 Aug 2019 19:03:23 +0530
Organization: IBM
In-Reply-To: <bb3dc624-1249-2418-f9da-93da8c11e7f5@kernel.org>
References: <20190816061804.14840-1-chandan@linux.ibm.com>
 <20190816061804.14840-6-chandan@linux.ibm.com>
 <bb3dc624-1249-2418-f9da-93da8c11e7f5@kernel.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19081913-0020-0000-0000-000003615D4C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081913-0021-0000-0000-000021B6895A
Message-Id: <20104514.oSSJcvNEEM@localhost.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-19_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908190153
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hzhlO-008m1M-Nc
Subject: Re: [f2fs-dev] [PATCH V4 5/8] f2fs: Use read_callbacks for
 decrypting file data
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
Cc: ebiggers@kernel.org, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 hch@infradead.org, linux-fscrypt@vger.kernel.org, adilger.kernel@dilger.ca,
 chandanrmail@gmail.com, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sunday, August 18, 2019 7:15:42 PM IST Chao Yu wrote:
> Hi Chandan,
> 
> On 2019-8-16 14:18, Chandan Rajendra wrote:
> > F2FS has a copy of "post read processing" code using which encrypted
> > file data is decrypted. This commit replaces it to make use of the
> > generic read_callbacks facility.
> 
> I remember that previously Jaegeuk had mentioned f2fs will support compression
> later, and it needs to reuse 'post read processing' fwk.
> 
> There is very initial version of compression feature in below link:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/log/?h=compression
> 
> So my concern is how can we uplift the most common parts of this fwk into vfs,
> and meanwhile keeping the ability and flexibility when introducing private
> feature/step in specified filesytem(now f2fs)?
> 
> According to current f2fs compression's requirement, maybe we can expand to
> 
> - support callback to let filesystem set the function for the flow in
> decompression/verity/decryption step.
> - support to use individual/common workqueue according the parameter.
> 
> Any thoughts?
>

Hi,

F2FS can be made to use fscrypt's queue for decryption and hence can reuse
"read callbacks" code for decrypting data.

For decompression, we could have a STEP_MISC where we invoke a FS provided
callback function for FS specific post read processing? 

Something like the following can be implemented in read_callbacks(),
	  case STEP_MISC:
		  if (ctx->enabled_steps & (1 << STEP_MISC)) {
			  /*
			    ctx->fs_misc() must process bio in a workqueue
			    and later invoke read_callbacks() with
			    bio->bi_private's value as an argument.
			  */
			  ctx->fs_misc(ctx->bio);
			  return;
		  }
		  ctx->cur_step++;

The fs_misc() callback can be passed in by the filesystem when invoking
read_callbacks_setup_bio().

-- 
chandan





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
