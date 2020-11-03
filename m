Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C032A3EFE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Nov 2020 09:33:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZrlK-0005es-U5; Tue, 03 Nov 2020 08:33:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daejun7.park@samsung.com>) id 1kZrlI-0005eh-P5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 08:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TxGvMOanx4q5d+aeauiVFV2oHKiQjYO6kUB0hmAZVQo=; b=K3qG5DyDhg6R68DOcFCFyIHf+D
 IrrkUCMWdiQDm6YE4B8yev4YGeJ/rl/KrLM7KqcN399kcK5K040uBrmP2+A+9EKoyJRHfmWZqf9rr
 IjrzytwnZaZDdTM93SEVkRSxYltioU4RXgRYv0jjH3Yt/BslMHZfgFLHET0slIOOe7V8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TxGvMOanx4q5d+aeauiVFV2oHKiQjYO6kUB0hmAZVQo=; b=cpb1EhJbfOKKy/rMgigAsG9/TE
 r4ciRUelfwTPzOTRlJaSPXPDOdkxWMTE8PlbHhlbtzJzslOvbaNJVmzNuRctcrMS65UqXngnzWZCA
 cehjzfuSBrp0pTp253TcIH0EWPMMe1/EM/HOhlnG9fVPZ3xwIqMpJJhrfJysbv5Ova+I=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZrl4-007TMp-Ga
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 08:33:52 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20201103083312epoutp03afe76f1cd823cf5f949e1d6cf54f16de~D8mGIamDS2843428434epoutp033
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 Nov 2020 08:33:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20201103083312epoutp03afe76f1cd823cf5f949e1d6cf54f16de~D8mGIamDS2843428434epoutp033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604392393;
 bh=TxGvMOanx4q5d+aeauiVFV2oHKiQjYO6kUB0hmAZVQo=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=L1Z/DcDJPfa9zQLtjWvjrGedE1nnfUWYQimRrz4J4Kc6G2FHNwFJPgprJIEDaf2DF
 +EMd6BKGHrNUmf6UOfolqjIBqrMcajBVD8fIL8VS2Py+q2ej9EKgdQ8zy6vO68RDdI
 XQ7byPwg55Kg2udoAeHOjMDnXHHFkkOlCjMHJmkw=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20201103083312epcas2p453b1c487800a823b54e7bd7c456f285a~D8mFWDGK53273432734epcas2p4T;
 Tue,  3 Nov 2020 08:33:12 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.184]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4CQNMn6Dp6zMqYm0; Tue,  3 Nov
 2020 08:33:09 +0000 (GMT)
X-AuditID: b6c32a48-a9948a800000cd1f-b6-5fa115c3fdfc
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 EC.0D.52511.3C511AF5; Tue,  3 Nov 2020 17:33:07 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: Chao Yu <yuchao0@huawei.com>, Daejun Park <daejun7.park@samsung.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <609445f8-de3b-eb79-449c-020125799449@huawei.com>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20201103083306epcms2p804f8fcbe11584488f476cacb9e28c5ac@epcms2p8>
Date: Tue, 03 Nov 2020 17:33:06 +0900
X-CMS-MailID: 20201103083306epcms2p804f8fcbe11584488f476cacb9e28c5ac
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphl+LIzCtJLcpLzFFi42LZdljTTPew6MJ4gwdXOC1OTz3LZPHykKbF
 qgfhFr39W9ksnqyfxWyx+eAGZottnwUtjp98x2hxaZG7xeVdc9gsOi59ZrKY8HIJi8XtLVwW
 ndPXsFgsWribxWLq47WsDgIeLUfesnpsWtXJ5rF7wWcmj74tqxg9Pm+SC2CNamC0SSxKzsgs
 S1VIzUvOT8nMS7dVCg1x07VQUsjILy6xVYo2tDDSM7Q01TOx1DMyj7UyNDAwMlVSyEvMTbVV
 qtCF6lZSKEouAKouSS0uKUpNTgUKFTkUlySmp+oVJ+YWl+al6yXn5yoplCXmlAL1Kenb2WSk
 JqakFikkPGHM+LdhI0vBVb6Kc0ueMjUw3uLuYuTkkBAwkWj9NIexi5GLQ0hgB6PEsqtHWbsY
 OTh4BQQl/u4QBqkRFgiQ+LV3NzuILSSgJLH+4ix2iLiexK2HaxhBbDYBHYnpJ+6zg8wREZjD
 KPF/0WkmEIdZYBKLxNfGaawQ23glZrQ/ZYGwpSW2L98K1s0pYCex78crqBoNiR/LepkhbFGJ
 m6vfssPY74/NZ4SwRSRa752FqhGUePBzN1RcUuLY7g9MEHa9xNY7v8A+kxDoYZQ4vPMW1AJ9
 iWsdG8GO4BXwlXg9cRvYAhYBVYlLB39ADXWRmDqtGWwos4C8xPa3c5hBocIsoCmxfpc+iCkh
 oCxx5BYLzFsNG3+zo7OZBfgkOg7/hYvvmPcE6jQ1iXU/1zNNYFSehQjqWUh2zULYtYCReRWj
 WGpBcW56arFRgQlyTG9iBKdoLY8djLPfftA7xMjEwXiIUYKDWUmEtyZyXrwQb0piZVVqUX58
 UWlOavEhxiqgLycyS4km5wOzRF5JvKGZgZGZqbGJsbGpiSnZwqZGZmYGlqYWpmZGFkrivKEr
 ++KFBNITS1KzU1MLUotgljNxcEo1MEWt/VR3n+X0VnUXxU0V69XWBwXeyq/j2Lb9azXDhtwP
 Wxcev1VZ7HV9lUx/x7Ild8quHTNoUv+yanap+2KVCX9/XpZeK7jU0SDWaZ+ycEn0n7lnLwtN
 ybqy/2/hF5kis01Lf785/Iblep+7Vds3gZCnX1NvpO7ccebX/j8mX2t3us3x0vzs5VE2Mbnh
 NfutG0Y3kySd3d9MClaTuZg7Q0Jy9sop2jzzL10X9H22rvrgz703fpmcjn141mXOB1mZP5Zq
 7Lm83lKGn9fcbFU4+qZcY1+a1gnTY3usNjO8M+5uVniXJSQnevjNfe8q3Tmem6fbNQg/vVHn
 X328zNdG/dcrgYOeC5R1C2MUD2vsrvuhxFKckWioxVxUnAgAbx65sp8EAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201103064039epcms2p30ecac0e7cefff0d50745f2e2e61ce38e
References: <609445f8-de3b-eb79-449c-020125799449@huawei.com>
 <20201103064039epcms2p30ecac0e7cefff0d50745f2e2e61ce38e@epcms2p3>
 <CGME20201103064039epcms2p30ecac0e7cefff0d50745f2e2e61ce38e@epcms2p8>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kZrl4-007TMp-Ga
Subject: Re: [f2fs-dev] [PATCH] f2fs: change write_hint for hot/warm nodes
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
Reply-To: daejun7.park@samsung.com
Cc: yongmyung lee <ymhungry.lee@samsung.com>,
 Jieon Seol <jieon.seol@samsung.com>, Sang-yoon Oh <sangyoon.oh@samsung.com>,
 Sung-Jun Park <sungjun07.park@samsung.com>,
 Mankyu PARK <manq.park@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Keoseong Park <keosung.park@samsung.com>,
 SEUNGUK SHIN <seunguk.shin@samsung.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Jinyoung CHOI <j-young.choi@samsung.com>,
 Jaemyung Lee <jaemyung.lee@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


>>>From 818a76a9aee5bf225565264274d211edb07bae7d Mon Sep 17 00:00:00 2001
>> From: Daejun Park <daejun7.park@samsung.com>
>> Date: Tue, 3 Nov 2020 15:30:26 +0900
>> 
>> 
>> In the fs-based mode of F2FS, the mapping of hot/warm node to
>> WRITE_LIFE_NOT_SET should be changed to WRITE_LIFE_SHORT.
>> 
>> As a result of analyzing the write pattern of f2fs using real workload,
>> hot/warm nodes have high update ratio close to hot data.[*]
>> However, F2FS passes write hints for hot/warm nodes as WRITE_LIFE_NOT_SET.
>> 
>> Furthermore, WRITE_LIFE_NOT_SET is a default value of write hint when it is
>> not provided from the file system.
>> In storage, write_hint is used to distinguish streams (e.g. NVMe).
>> So, the hot/warm node of F2FS is not distinguished from other write_hints,
>> which can make the wrong stream seperation.
>> 
>> * Liang, Yu, et al. "An empirical study of F2FS on mobile devices." 2017
>> IEEE 23rd International Conference on Embedded and Real-Time Computing
>> Systems and Applications (RTCSA).
>
>Could you please update Documentation/filesystems/f2fs.rst as well?
>
>Thanks,

Sure, I will make it next patch.

Thanks

>> 
>> Signed-off-by: Daejun Park <daejun7.park@samsung.com>
>> ---
>>   fs/f2fs/segment.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 1596502f7375..7b42bb10c6c3 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -3208,7 +3208,7 @@ enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
>>   				return WRITE_LIFE_EXTREME;
>>   		} else if (type == NODE) {
>>   			if (temp == WARM || temp == HOT)
>> -				return WRITE_LIFE_NOT_SET;
>> +				return WRITE_LIFE_SHORT;
>>   			else if (temp == COLD)
>>   				return WRITE_LIFE_NONE;
>>   		} else if (type == META) {
>> 
>
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
