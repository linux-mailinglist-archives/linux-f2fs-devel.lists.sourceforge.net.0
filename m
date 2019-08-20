Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 279CB95663
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2019 07:04:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzwJW-0006Wa-U5; Tue, 20 Aug 2019 05:04:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chandan@linux.ibm.com>) id 1hzwJV-0006WS-M3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 05:04:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L3zhRs+p+so5AA0MBRHfJqElib8LYeeS1qWPatUvea0=; b=XiJUSDBuOmJuJQzmmQ7WxrmfPP
 rCcSqO3vtGhciE+VlaZ5ZQqPzdKIeyIyxdwzxD1Sa69c0HkIsqOaXPvcTqHroCS4VDgBS5j0yAA58
 5Boot7kbwtrRTW0BchnNEEj2tMCBo3b4ARVQX8pla+SJCNr0Z9vObQpDX/dCfPU+WvYY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:References
 :In-Reply-To:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L3zhRs+p+so5AA0MBRHfJqElib8LYeeS1qWPatUvea0=; b=YGSzcptxyklhKZZCwQgW9yu9j0
 rw3s7pXWosWdVCUJcwBty7e7N+Q6fVFMwcG7XRhTOGcUdmLAsjgQmonV/MkE3xzMY04YRK9hGyg5m
 YTDpQDKSdSqjYYdzdEMX4MCaNl+YH5cA0Fu3ogv//eibmJY7Ati8K4XqGFGwZsbMLDp8=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzwJT-009Uiw-R6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 05:04:09 +0000
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7K52NGw103309
 for <linux-f2fs-devel@lists.sourceforge.net>; Tue, 20 Aug 2019 01:03:58 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ug666879e-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>; Tue, 20 Aug 2019 01:03:58 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-f2fs-devel@lists.sourceforge.net> from <chandan@linux.ibm.com>;
 Tue, 20 Aug 2019 06:03:56 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 20 Aug 2019 06:03:51 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7K53U6o39322076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 05:03:30 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE4E4A4040;
 Tue, 20 Aug 2019 05:03:50 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6610FA4055;
 Tue, 20 Aug 2019 05:03:48 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.62.92])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Aug 2019 05:03:48 +0000 (GMT)
From: Chandan Rajendra <chandan@linux.ibm.com>
To: tytso@mit.edu, ebiggers@kernel.org
Date: Tue, 20 Aug 2019 10:35:29 +0530
Organization: IBM
In-Reply-To: <20190816061804.14840-6-chandan@linux.ibm.com>
References: <20190816061804.14840-1-chandan@linux.ibm.com>
 <20190816061804.14840-6-chandan@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19082005-0012-0000-0000-000003409143
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082005-0013-0000-0000-0000217AB39E
Message-Id: <1652707.8YmLLlegLt@localhost.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=836 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200052
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hzwJT-009Uiw-R6
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
Cc: linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 linux-fscrypt@vger.kernel.org, adilger.kernel@dilger.ca,
 chandanrmail@gmail.com, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Friday, August 16, 2019 11:48 AM Chandan Rajendra wrote:
> F2FS has a copy of "post read processing" code using which encrypted
> file data is decrypted. This commit replaces it to make use of the
> generic read_callbacks facility.
> 
> Signed-off-by: Chandan Rajendra <chandan@linux.ibm.com>

Hi Eric and Ted,

Looks like F2FS requires a lot more flexiblity than what can be offered by
read callbacks i.e.

1. F2FS wants to make use of its own workqueue for decryption, verity and
   decompression.
2. F2FS' decompression code is not an FS independent entity like fscrypt and
   fsverity. Hence they would need Filesystem specific callback functions to
   be invoked from "read callbacks". 

Hence I would suggest that we should drop F2FS changes made in this
patchset. Please let me know your thoughts on this.

-- 
chandan





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
