Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1FB109A44
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Nov 2019 09:35:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZWJM-0007HX-Sq; Tue, 26 Nov 2019 08:35:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <riteshh@linux.ibm.com>) id 1iZWJJ-0007HB-UZ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 08:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=viH++RGLtHIIcXIqmfzy24uIbNbLhz76bF2bquRQVa8=; b=b5BOCyvLqzXGoiJYefSuTDaPmE
 3zuxoFlqnyGDwnGFIkFmOQfvBa72BqHUVjxjZHVGlYZ+exeiw2iEYL0s+LpCeGmKAVP6IG1VDkYOc
 oB7DkR7qJcWoRjv39xVpzevor+Gj5n1KAfKZQyXPM/QzzU8pe/Ta7vgEG41xeIiVfVeY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=viH++RGLtHIIcXIqmfzy24uIbNbLhz76bF2bquRQVa8=; b=l3pE9pYLAlpk4WNUyCfo8sYQzz
 PCZPx5fyBpZZ2Trwq+SXbtsYLsW+/kdYDUNGQgvuxYaVXTrcUW+HSPRBLWhWHrQ/dVp4/dHlXUVkc
 finbunELz6cfGFSi+cA76Dv3bN5bgNJ45LfhXvol5nDN1/hU5MtALU1YgSXfXNVV2k4I=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iZWJI-00DnxL-2A
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 08:35:01 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQ8QeTW127914
 for <linux-f2fs-devel@lists.sourceforge.net>; Tue, 26 Nov 2019 03:34:52 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wfjr05e94-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>; Tue, 26 Nov 2019 03:34:51 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-f2fs-devel@lists.sourceforge.net> from <riteshh@linux.ibm.com>;
 Tue, 26 Nov 2019 08:34:49 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 26 Nov 2019 08:34:46 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xAQ8YjDC35914064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 08:34:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9A2CA405F;
 Tue, 26 Nov 2019 08:34:45 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1FD5A405B;
 Tue, 26 Nov 2019 08:34:43 +0000 (GMT)
Received: from [9.199.158.76] (unknown [9.199.158.76])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Nov 2019 08:34:43 +0000 (GMT)
To: Damien Le Moal <damien.lemoal@wdc.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <20191126075719.1046485-1-damien.lemoal@wdc.com>
From: Ritesh Harjani <riteshh@linux.ibm.com>
Date: Tue, 26 Nov 2019 14:04:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20191126075719.1046485-1-damien.lemoal@wdc.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19112608-0028-0000-0000-000003C017DE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112608-0029-0000-0000-000024831879
Message-Id: <20191126083443.F1FD5A405B@b06wcsmtp001.portsmouth.uk.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_01:2019-11-21,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911260076
X-Spam-Score: 1.6 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.6 FORGED_MUA_MOZILLA     Forged mail pretending to be from Mozilla
X-Headers-End: 1iZWJI-00DnxL-2A
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix direct IO handling
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
Cc: linux-fsdevel@vger.kernel.org, Javier Gonzalez <javier@javigon.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello Damien,

IIUC, you are trying to fix a stale data read by DIO read for the case
you explained in your patch w.r.t. DIO-write forced to write as buffIO.

Coincidentally I was just looking at the same code path just now.
So I do have a query to you/f2fs group. Below could be silly one, as I
don't understand F2FS in great detail.

How is the stale data by DIO read, is protected against a mmap
writes via f2fs_vm_page_mkwrite?

f2fs_vm_page_mkwrite()		 f2fs_direct_IO (read)
					filemap_write_and_wait_range()
	-> f2fs_get_blocks()				
					 -> submit_bio()

	-> set_page_dirty()

Is above race possible with current f2fs code?
i.e. f2fs_direct_IO could read the stale data from the blocks
which were allocated due to mmap fault?

Am I missing something here?

-ritesh

On 11/26/19 1:27 PM, Damien Le Moal wrote:
> f2fs_preallocate_blocks() identifies direct IOs using the IOCB_DIRECT
> flag for a kiocb structure. However, the file system direct IO handler
> function f2fs_direct_IO() may have decided that a direct IO has to be
> exececuted as a buffered IO using the function f2fs_force_buffered_io().
> This is the case for instance for volumes including zoned block device
> and for unaligned write IOs with LFS mode enabled.
> 
> These 2 different methods of identifying direct IOs can result in
> inconsistencies generating stale data access for direct reads after a
> direct IO write that is treated as a buffered write. Fix this
> inconsistency by combining the IOCB_DIRECT flag test with the result
> of f2fs_force_buffered_io().
> 
> Reported-by: Javier Gonzalez <javier@javigon.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>   fs/f2fs/data.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 5755e897a5f0..8ac2d3b70022 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1073,6 +1073,8 @@ int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
>   	int flag;
>   	int err = 0;
>   	bool direct_io = iocb->ki_flags & IOCB_DIRECT;
> +	bool do_direct_io = direct_io &&
> +		!f2fs_force_buffered_io(inode, iocb, from);
>   
>   	/* convert inline data for Direct I/O*/
>   	if (direct_io) {
> @@ -1081,7 +1083,7 @@ int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
>   			return err;
>   	}
>   
> -	if (direct_io && allow_outplace_dio(inode, iocb, from))
> +	if (do_direct_io && allow_outplace_dio(inode, iocb, from))
>   		return 0;
>   
>   	if (is_inode_flag_set(inode, FI_NO_PREALLOC))
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
