Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 867BE976EB8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 18:31:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1somjB-0003wN-51;
	Thu, 12 Sep 2024 16:31:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1somj9-0003w7-9f
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 16:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vy7lCYSbdz26N4UI7fqWr6sAhZElmMyKMCnXT+wW9js=; b=HP/YQdBmlEtwbs5UC0YmIvbmwK
 LIGj98vM49IR+j4KGzQboiyP0d3EBXsRAJ73R4yxMD0PX3qLmok0zb/278Rf1L8XbVKqYhVZqyhk+
 ckwkda4T8JI5O4mxACkF3X5cWQcyf2fBSK/9+4oDlI2uK1rNaywN9GpRtOw3gC9IBDq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:From:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vy7lCYSbdz26N4UI7fqWr6sAhZElmMyKMCnXT+wW9js=; b=Q7/gynZ/uwdQKeMlmmk0fBQhAI
 5puPBoJ8RB4POx+gtT9QQRAuZyItn8P3GIM2K/GobHKcfZL3oWL2VQ4EtBC8GKp5Pjt2yzGbuAQxR
 bxIPDbJxzFstnBpMntFXezMyemWtGUC5thD8pczBUe2F2qyRKytgqNOJ1swEW54mgMts=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1somj7-0001Mw-Mb for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 16:31:27 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20240912163113epoutp02466c3efc12c701bd1f874bb2929768d8~0jCsJ48zf1232712327epoutp02e
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Sep 2024 16:31:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20240912163113epoutp02466c3efc12c701bd1f874bb2929768d8~0jCsJ48zf1232712327epoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1726158673;
 bh=vy7lCYSbdz26N4UI7fqWr6sAhZElmMyKMCnXT+wW9js=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=jLgvOokAe+FhuM9YNK3Hy86Su/KXSz86Q+mc3gEvkdWV+q6u/Tnaqp+rXymB/BFjw
 bmP85s6EXygQ5WqsP0m0CSc/cqRqwH8fMvxwM1aldaQbm+i6CssiiGaBCHSD49lS/S
 oLz+a0/D/pOsZb9VfD7bIOjddotg/tpy0oJhI/Bc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20240912163113epcas5p36c0a7ab9eec20e8b209022fda8ea0c0d~0jCrpc_cZ2285522855epcas5p3S;
 Thu, 12 Sep 2024 16:31:13 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.176]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4X4NH338G0z4x9Pp; Thu, 12 Sep
 2024 16:31:11 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 5D.1E.09640.F4713E66; Fri, 13 Sep 2024 01:31:11 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20240912163110epcas5p400bbdbc9b6fbfcd8fc2cb06119bf1515~0jCpBPquT0871108711epcas5p4d;
 Thu, 12 Sep 2024 16:31:10 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240912163110epsmtrp2e4b05be92f9a9935b208ffd318ba7ec4~0jCpARmGE2388023880epsmtrp2H;
 Thu, 12 Sep 2024 16:31:10 +0000 (GMT)
X-AuditID: b6c32a49-a57ff700000025a8-f4-66e3174ffa9a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 37.90.08964.E4713E66; Fri, 13 Sep 2024 01:31:10 +0900 (KST)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240912163103epsmtip12a8aad761a334eca507fe293432399a7~0jCigBZNm1719617196epsmtip1M;
 Thu, 12 Sep 2024 16:31:02 +0000 (GMT)
Message-ID: <e6ae5391-ae84-bae4-78ea-4983d04af69f@samsung.com>
Date: Thu, 12 Sep 2024 22:01:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
From: Kanchan Joshi <joshi.k@samsung.com>
In-Reply-To: <20240912130235.GB28535@lst.de>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xbVRzeubcvZjqvhdlDjROauTlmC8XSXdhgM9vkMkAbh2bTLNDRyyOU
 tukDkSzyENksDhQMmx2kMLCdJY7wHAhNlhbGmDIWGHawMXGULQF5FKIEELXtReW/7/zO953v
 fL9ffiyUU8zksTKVOlKjlCn4jO20Dse+EME73Km0sAEzB2+cKGfgs44lgFctrqL43xPPEHzs
 ZheCf9fYh+BXLn2K4K4mI4o3l7PwqUfLTHzVbGXiFfafAW4b348PX43Fe2wDNNxknmbipc5O
 Bm7p/wvBO9ZNKH59doGGD2300/EhYzXzyIvEyP14YuhxM42oqrjDIEYG9USL9XMG0dqQT3TX
 LiNE91gBg3BPj9OIsjYrIH6q7WUSyy27iBbXHCJlf5B1KIOUyUlNEKlMVckzlenR/PiTyUeT
 IyRhIoEoEj/AD1LKsslo/rEEqeCtTIUnMz8oR6bQe0pSmVbLD405pFHpdWRQhkqri+aTarlC
 LVYLtbJsrV6ZLlSSuihRWFh4hIeYkpXR535IU/+G5T6zcwuAi20AfiyIiaFldI5pANtZHKwb
 wJXaFab3goMtAVhqO0zhPwCcN540AJZP0P00keLbALS0twPqMAdg3fUVxCtgYzHwduld4MU0
 7FXYPvIFnaq/AAe+cdG8eCd2Fq6NVvs4/lg0LL3o9NVRjAvHXSbfOwEYH07PDPoMUMxMg9+6
 hxjeXzCwffBepd7L8cNeh13uIgalfQXemKtGvXyINfnBujU3nYp5DI5P9DAo7A9n+tuYFObB
 5XnbZj0LTj6ZpFH4HOxsLdvUHoYFfz6ge31Rj2/TD6GU1w54cd2FUE1hwwslHIodDB9XTG8q
 ufDXyw10ikLAvsJAqlVjAF5ZNaNfgiDjlq4Yt6Q3bklj/N+4FtCsIJBUa7PTSW2EWqQkP/pv
 2Kmq7BbgW4eQuE4wMbkotAOEBewAslB+ALuC8SSNw5bLPs4jNapkjV5Bau0gwjOer1DezlSV
 Z5+UumSRODJMLJFIxJFvSER8Lnv2sxo5B0uX6cgsklSTmn91CMuPV4CE5xws3DFbfJybtJZ/
 YiDx3rXexurG3DHLc8XStsqzwrkG6Ymo2JRQSZ0Os4uSMIVN0DFzs23ox/O/HOg6lc5JMuSn
 VPaLTV8Hn7Fc2nbKsG1l6ulu2bUbR9+uCeY6FzgXTKO7BJFcU3hRcg2RNzD17l2d47WXl1p0
 VwP3+sc3v8nTx+J505XCT5y7f5+0Xh4W1T9qM1dZWRtCi9q8UOa41a56MPiwJl4KqubPJe5B
 vi9YHI5D69Oel79/vP5MSUKAYOzDjQV2THdEb1mOJuu2Ni7UUMS7ELXep3wvr8RJlzrZCeGI
 o7mx9f6dQkfJwSPFp3P3us+/VF6VtCfl9P6eW3yaNkMmCkE1Wtk/HCMLyJcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsWy7bCSnK6f+OM0g3n/mS1W3+1ns3h9+BOj
 xbQPP5kt/t99zmRx88BOJouVq48yWcye3sxk8WT9LGaLjf0cFo/vfGa3+LlsFbvFpEPXGC32
 3tK2uLTI3WLP3pMsFvOXPWW36L6+g81i+fF/TBbbfs9ntlj3+j2Lxfm/x1ktzs+aw+4g5nH5
 irfH+XsbWTymTTrF5nH5bKnHplWdbB6bl9R77F7wmclj980GNo+PT2+xePRtWcXocWbBEXaP
 z5vkPDY9ecsUwBvFZZOSmpNZllqkb5fAlXH0422WgjcCFc8PiTcwPuHtYuTgkBAwkdj9zLeL
 kYtDSGA3o8TdQ2fYuhg5geLiEs3XfrBD2MISK/89Z4coes0o0XNsDitIglfATuJE9zlGEJtF
 QFVi6+UeqLigxMmZT1hAbFGBJIk99xuZQGxhAVuJ7t7rYHFmoAW3nswHi4sIKEk8fXWWEWQB
 s8AyFomDU94yQWy7ySjxpKedEeRUNgFNiQuTS0EaOAV0JHZ+bGKDGGQm0bW1ixHClpfY/nYO
 8wRGoVlI7piFZN8sJC2zkLQsYGRZxSiZWlCcm55bbFhgmJdarlecmFtcmpeul5yfu4kRnA60
 NHcwbl/1Qe8QIxMH4yFGCQ5mJRHeSWyP0oR4UxIrq1KL8uOLSnNSiw8xSnOwKInzir/oTRES
 SE8sSc1OTS1ILYLJMnFwSjUwebOyBb/JDznTLcPvbDuvR9roMVdyubRI5AMJzbW39v343S/4
 deec34V/mVZ79rgHsoeFswUed0h4k7lQR+3BgSO5lZw7ZCaYCmYYV6tfZl10sF7X1CCm2X/q
 o1uS958c/CKhtvDwhQXT5v9w9LtUePnp1TRbZgWrRUm//E32PbGV4vMLq3N+KyfYdL//wiuP
 qUbVGU6ZLhxKvKo/X1x8+5D/GktEY780c0546GauZ4qntOUNFzxbutDq3y6GyzIy3K+bG1kZ
 e0XuXphTw3B0s+qcjROUNMNzPp7KZDoacOvjpJ8LdrNzv5ntvGnmjuiQycnPOBmUC65F+1RU
 srLe/yfVLrtp8ymTTgvJoDVKLMUZiYZazEXFiQB3nG6idgMAAA==
X-CMS-MailID: 20240912163110epcas5p400bbdbc9b6fbfcd8fc2cb06119bf1515
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240910151057epcas5p3369c6257a6f169b4caa6dd59548b538c
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151057epcas5p3369c6257a6f169b4caa6dd59548b538c@epcas5p3.samsung.com>
 <20240910150200.6589-5-joshi.k@samsung.com> <20240912130235.GB28535@lst.de>
X-Spam-Score: -4.8 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/12/2024 6:32 PM, Christoph Hellwig wrote: > On Tue, Sep
 10, 2024 at 08:31:59PM +0530, Kanchan Joshi wrote: >> From: Nitesh Shetty
 <nj.shetty@samsung.com> >> >> The incoming hint value maybe eithe [...] 
 Content analysis details:   (-4.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1somj7-0001Mw-Mb
Subject: Re: [f2fs-dev] [PATCH v5 4/5] sd: limit to use write life hints
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, brauner@kernel.org,
 jack@suse.cz, sagi@grimberg.me, martin.petersen@oracle.com,
 gost.dev@samsung.com, jlayton@kernel.org, vishak.g@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 James.Bottomley@HansenPartnership.com, linux-fsdevel@vger.kernel.org,
 chuck.lever@oracle.com, javier.gonz@samsung.com, viro@zeniv.linux.org.uk,
 linux-scsi@vger.kernel.org, kbusch@kernel.org, jaegeuk@kernel.org,
 Nitesh Shetty <nj.shetty@samsung.com>, bvanassche@acm.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/12/2024 6:32 PM, Christoph Hellwig wrote:
> On Tue, Sep 10, 2024 at 08:31:59PM +0530, Kanchan Joshi wrote:
>> From: Nitesh Shetty <nj.shetty@samsung.com>
>>
>> The incoming hint value maybe either lifetime hint or placement hint.
> 
> .. may either be .. ?

Sure.

>> Make SCSI interpret only temperature-based write lifetime hints.
>>
>> Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
>> Signed-off-by: Kanchan Joshi <joshi.k@samsung.com>
>> ---
>>   drivers/scsi/sd.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
>> index dad3991397cf..82bd4b07314e 100644
>> --- a/drivers/scsi/sd.c
>> +++ b/drivers/scsi/sd.c
>> @@ -1191,8 +1191,8 @@ static u8 sd_group_number(struct scsi_cmnd *cmd)
>>   	if (!sdkp->rscs)
>>   		return 0;
>>   
>> -	return min3((u32)rq->write_hint, (u32)sdkp->permanent_stream_count,
>> -		    0x3fu);
>> +	return min3((u32)WRITE_LIFETIME_HINT(rq->write_hint),
> 
> No fan of the screaming WRITE_LIFETIME_HINT. 

Macros tend to. Once it becomes lowercase (inline function), it will 
stop screaming.

    Or the fact that multiple
> things are multiplexed into the single rq->write_hint field to
> start with.

Please see the response in patch #1. My worries were:
(a) adding a new field and propagating it across the stack will cause 
code duplication.
(b) to add a new field we need to carve space within inode, bio and 
request.
We had a hole in request, but it is set to vanish after ongoing 
integrity refactoring patch of Keith [1]. For inode also, there is no 
liberty at this point [2].

I think current multiplexing approach is similar to ioprio where 
multiple io priority classes/values are expressed within an int type. 
And few kernel components choose to interpret certain ioprio values at will.

And all this is still in-kernel details. Which can be changed if/when 
other factors start helping.

[1] 
https://lore.kernel.org/linux-nvme/20240911201240.3982856-2-kbusch@meta.com/
[2] 
https://lore.kernel.org/linux-nvme/20240903-erfassen-bandmitglieder-32dfaeee66b2@brauner/


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
