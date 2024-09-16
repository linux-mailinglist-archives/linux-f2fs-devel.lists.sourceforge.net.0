Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D9897A315
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Sep 2024 15:49:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sqC6t-0008Uc-5o;
	Mon, 16 Sep 2024 13:49:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1sqC6r-0008UU-9d
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Sep 2024 13:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BFqkL5mVC2rMqwvnxCQzzd01AUlbkq9ItY512dFJKEU=; b=W/eoEL+kaSlmUjL4Wjc8Cf8CfQ
 W/4Hnq2SSJzxerr+E7P4vnF9JKFHyhBkfxtTkj2ssSqpEZs6KONC13i0NnfKsxfcqU3wDZrq3T8n2
 Rbjg8OSSXBTHwZkCPoZhXvm5L+JbHU+PchH/E0XwGI83qhgK1aU9uKZzG4WKDiKi1/Z0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:From:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BFqkL5mVC2rMqwvnxCQzzd01AUlbkq9ItY512dFJKEU=; b=KW/4nbh9xSsoUzIQn+y0+DI4qE
 4MASxa//XYE7Ht0xcX6MXJE3gch2tDwXtZqKnWDwA6iFvVuoh723Viz61UUrjNt0v0sEEN1yiNcKy
 5cQNyxG6AkuwBMGEDN8fWs3mBPafnro1V4xKe0Cxm9Cjx+3gEOA6Cd2W2RUXlBANCmyo=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sqC6n-0003B1-Pa for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Sep 2024 13:49:45 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20240916134929epoutp0144c08edd276e7c1f2d08504b82e4efb0~1vanuxS_v0226802268epoutp01Y
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Sep 2024 13:49:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20240916134929epoutp0144c08edd276e7c1f2d08504b82e4efb0~1vanuxS_v0226802268epoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1726494569;
 bh=BFqkL5mVC2rMqwvnxCQzzd01AUlbkq9ItY512dFJKEU=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=qd+4bIdJ5q+l6jSQ5QaQB2B32T7O+8lGcAi85+xiuHx/55y70FSUDNRQBiO+3tS8K
 3Y2URf6yxbnA8zbFAicMRuWuztpI5y9bujEku0fFoKPTfbUNXKqaciOsVKU/D7YQTF
 ENrWrWEa4/vRtkarxuN1MmGKdtamyUML4+TtQNKs=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20240916134927epcas5p26a35ee17ef7995c6f226ca8d18e05809~1vamGwbwN0311103111epcas5p2h;
 Mon, 16 Sep 2024 13:49:27 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.183]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4X6mVZ2M2Dz4x9Pv; Mon, 16 Sep
 2024 13:49:26 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 6C.32.09640.66738E66; Mon, 16 Sep 2024 22:49:26 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20240916134925epcas5p3771dd61e689dd5669b51c1183e382f4b~1vajzurKW0738707387epcas5p3V;
 Mon, 16 Sep 2024 13:49:25 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240916134925epsmtrp237639dd21ae5f1aede967bd1a37e60ad~1vajyzvUl1077710777epsmtrp2D;
 Mon, 16 Sep 2024 13:49:25 +0000 (GMT)
X-AuditID: b6c32a49-a57ff700000025a8-7f-66e8376665a5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 16.1F.08964.56738E66; Mon, 16 Sep 2024 22:49:25 +0900 (KST)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240916134922epsmtip21edf3a4cb3ab814ba4bb88bd4261e273~1vag57usc2461424614epsmtip22;
 Mon, 16 Sep 2024 13:49:22 +0000 (GMT)
Message-ID: <4a39215a-1b0e-3832-93bd-61e422705f8b@samsung.com>
Date: Mon, 16 Sep 2024 19:19:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
From: Kanchan Joshi <joshi.k@samsung.com>
In-Reply-To: <20240913080659.GA30525@lst.de>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0xTZxjed07pRQY7Fjo+ybjYyYIwLh2lfDhgSzR6XF1Csi1MjEKFw2WU
 tukFdY5Y5jYEBAYycRUGKKDUxSo4BQq4cQnRcIuoVQSG2CrIGNdoGDLW9rCNf8/7fs/zPe8l
 LxvnZrPc2akyNaWUSaR85gbG9Y6tvgFJYRNJwZ3zzujSSCETTXXMA3R6dglHqyPPMPTw1yYM
 1V3qwtDZ0uMYMht0OLpayEZPhhdYaKlWz0LF7fcBah3yR3fO7UItrbcYqKLWwkJ5pkYmutD9
 N4auL1fg6PLUDAP1r3Q7oH5dGevDN8nBu2Kyf/QqgzxdfJtJDvZqyHp9DpNsqD5GGisXMNL4
 UMsk5yxDDLLgmh6QPZWdLHKh3pOsN09j0U6xaREplCSRUnpTsgR5YqosOZIv/iRue1yoKFgQ
 IAhHYXxvmSSdiuTv2BMdsDNVau2Z750hkWqsqWiJSsUPiopQyjVqyjtFrlJH8ilFolQhVASq
 JOkqjSw5UEaptwmCg98LtRLj01Ke/VLCVHzjc/jc5BKuBdUeuYDNhoQQZvdtygUb2FzCCOCD
 CQOLDuYBHCxbwOjgBYCLRQ0gF3Dsiqbh8wz6oRXAE8snAR1MA1jR0MawsZyIKFhvNDrYMIPw
 gfcLh1l0fiO89aPZzuERB+Ff98rsv7oQkTAv32TP44QbHDJXYDbsSvCh5Xmv3QAnahmwZq6f
 aSucSWyFA6c0Ng6HeBcuPbntQGu94I3pMtzGh4SBA7tNE0y67B3QVPQ7i8Yu8Hn3tTXsDhf+
 bF3jpMGx8TEGjb+CjQ0FDjT+AGpfPXCw+eJWX0NzEO3lDPOXzRg9Ryd44jsuzd4MR4sta0o3
 +PhMtQNNIWFX1tqor2Bwpmmc9T3w1q2bim5d97p13ej+N64EDD3YRClU6cmUKlQhkFGH/tt3
 gjy9Htgvwm93IxgZmw1sBxgbtAPIxvmuTpHLliSuU6LkyJeUUh6n1EgpVTsIta6nCHfnJcit
 JyVTxwmE4cFCkUgkDA8RCfhuTlPflidyiWSJmkqjKAWl/FeHsTnuWizwaLemvXa+jCuFrvLJ
 lbZDztv9oxxvGGuqXGJCs4ZnnuZP6OfffuuMWmoQ64VH8Xz/3b5hLZ+bPh196mgxdpUEfXzq
 ck6vN3dvdukfdarVmPDNkx4os1TPyTWEvJitPz+n4+3p9d02ffi39J6vP3L8ovxm7MtXPgMx
 eMe+ldWbLQNnVzKzXs8IFw8diQ3r8VkM+WH/1E/z4i1e71z5LHf8kdfPBbhnrXuV4QIrotnT
 a7HczzNm71LORu2jClG8b7F0X+PFqaoSt6S2ZnjcIy7nIqsS8UbMWyaXa5h3D2qVuzJfHovo
 yz+ws+HeNE/cnoeZOftfKzDV9T2OB+/zMjoP3HmDz1ClSAR+uFIl+QfgcR/PmgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7bCSvG6q+Ys0g+9vRCxW3+1ns3h9+BOj
 xbQPP5kt/t99zmRx88BOJouVq48yWcye3sxk8WT9LGaLjf0cFo/vfGa3+LlsFbvFpEPXGC32
 3tK2uLTI3WLP3pMsFvOXPWW36L6+g81i+fF/TBbbfs9ntlj3+j2Lxfm/x1ktzs+aw+4g5nH5
 irfH+XsbWTymTTrF5nH5bKnHplWdbB6bl9R77F7wmclj980GNo+PT2+xePRtWcXocWbBEXaP
 z5vkPDY9ecsUwBvFZZOSmpNZllqkb5fAlfF86xS2ghbVikUvfzI3MC6R7WLk5JAQMJHYeWcx
 SxcjF4eQwG5GifVHn7NAJMQlmq/9YIewhSVW/nvODlH0mlHi5t5mNpAEr4CdxKbdu1lBbBYB
 VYlr/XfYIeKCEidnPgEbJCqQJLHnfiMTiC0sYCvR3XsdLM4MtODWk/lgcREBJYmnr84ygixg
 FljGInFwylsmiG0bmCT+H94NNJWDg01AU+LC5FKQBk4BHYmfj0+xQgwyk+ja2sUIYctLbH87
 h3kCo9AsJHfMQrJvFpKWWUhaFjCyrGKUTC0ozk3PLTYsMMxLLdcrTswtLs1L10vOz93ECE4J
 Wpo7GLev+qB3iJGJg/EQowQHs5IIr+3vp2lCvCmJlVWpRfnxRaU5qcWHGKU5WJTEecVf9KYI
 CaQnlqRmp6YWpBbBZJk4OKUamK4l+DNkGAsZRG8ubjnim8D7Rp7vkYI+f8jxkouH2a/mPT1z
 55laSfmznO+LJ3T7rLydb2Q4Q4U9Zt0/xtkzP66L++S19Hu5v1Tsqiij5FtG+vL7IxX/ivlE
 ynRdjDH6vYRzylExAYYT+humPaiYwpw4eXa7dGbvrDhXIfPrx5Uv+ffL1y4Peq16ZIb8P/uu
 xza13xmeKtmn8m9Lajw5dUrWtokukbXL2b9OK79T9V5GUqzRquOS4at/Um/1rVnv5Csv37jz
 aeajaEHhwxL67jrTO7sf8KokpvAXtt3V+nlIke2dwfHorMKDOqJ/lDf/lLA/cWp7ZmLsBaci
 mct5Tu72LtLsqm/FfjV8UalTYinOSDTUYi4qTgQArd2N5XgDAAA=
X-CMS-MailID: 20240916134925epcas5p3771dd61e689dd5669b51c1183e382f4b
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240910151057epcas5p3369c6257a6f169b4caa6dd59548b538c
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151057epcas5p3369c6257a6f169b4caa6dd59548b538c@epcas5p3.samsung.com>
 <20240910150200.6589-5-joshi.k@samsung.com> <20240912130235.GB28535@lst.de>
 <e6ae5391-ae84-bae4-78ea-4983d04af69f@samsung.com>
 <20240913080659.GA30525@lst.de>
X-Spam-Score: -4.2 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/13/2024 1:36 PM, Christoph Hellwig wrote: > On Thu, Sep
 12, 2024 at 10:01:00PM +0530, Kanchan Joshi wrote: >> Please see the response
 in patch #1. My worries were: >> (a) adding a new field and p [...] 
 Content analysis details:   (-4.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sqC6n-0003B1-Pa
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

On 9/13/2024 1:36 PM, Christoph Hellwig wrote:
> On Thu, Sep 12, 2024 at 10:01:00PM +0530, Kanchan Joshi wrote:
>> Please see the response in patch #1. My worries were:
>> (a) adding a new field and propagating it across the stack will cause
>> code duplication.
>> (b) to add a new field we need to carve space within inode, bio and
>> request.
>> We had a hole in request, but it is set to vanish after ongoing
>> integrity refactoring patch of Keith [1]. For inode also, there is no
>> liberty at this point [2].
>>
>> I think current multiplexing approach is similar to ioprio where
>> multiple io priority classes/values are expressed within an int type.
>> And few kernel components choose to interpret certain ioprio values at will.
>>
>> And all this is still in-kernel details. Which can be changed if/when
>> other factors start helping.
> 
> Maybe part of the problem is that the API is very confusing.  A smal
> part of that is of course that the existing temperature hints already
> have some issues, but this seems to be taking them make it significantly
> worse.

Can you explain what part is confusing. This is a simple API that takes 
type/value pair. Two types (and respective values) are clearly defined 
currently, and more can be added in future.

> Note: this tries to include highlevel comments from the discussion of
> the previous patches instead of splitting them over multiple threads.
> 
> F_{S,G}ET_RW_HINT works on arbitrary file descriptors with absolutely no
> check for support by the device or file system and not check for the
> file type.  That's not exactly good API design, but not really a major
> because they are clearly designed as hints with a fixed number of
> values, allowing the implementation to map them if not enough are
> supported.
> 
> But if we increase this to a variable number of hints that don't have
> any meaning (and even if that is just the rough order of the temperature
> hints assigned to them), that doesn't really work.  We'll need an API
> to check if these stream hints are supported and how many of them,
> otherwise the applications can't make any sensible use of them.

- Since writes are backward compatible, nothing bad happens if the 
passed placement-hint value is not supported. Maybe desired outcome (in 
terms of WAF reduction) may not come but that's not a kernel problem 
anyway. It's rather about how well application is segregating and how 
well device is doing its job.

- Device is perfectly happy to work with numbers (0 to 256 in current 
spec) to produce some value (i.e., WAF reduction). Any extra 
semantics/abstraction on these numbers only adds to the work without 
increasing that value. If any application needs that, it's free to 
attach any meaning/semantics to these numbers.

Extra abstraction has already been done with temperature-hint (over 
multi-stream numbers). If that's useful somehow, we should consider 
going back to using those (v3)? But if we are doing a new placement 
hint, it's better to use plain numbers without any semantics. That will 
be (a) more scalable, (b) be closer to what device can readily accept, 
(c) justify why placement should be a different hint-type, and (d) help 
Kernel because it has to do less (no intermediate mapping/transformation 
etc).

IMHO sticking to the existing hint model and doing less (in terms of 
abstraction, reporting and stuff) in kernel maybe a better path.

> If these aren't just stream hints of the file system but you actually
> want them as an abstract API for FDP you'll also need to actually
> expose even more information like the reclaim unit size, but let's
> ignore that for this part of the discssion.
> 
> Back the the API: the existing lifetime hints have basically three
> layers:
> 
>   1) syscall ABI
>   2) the hint stored in the inode
>   3) the hint passed in the bio
> 
> 1) is very much fixed for the temperature API, we just need to think if
>     we want to support it at the same time as a more general hints API.
>     Or if we can map one into another.  Or if we can't support them at
>     the same time how that is communicated.
> 
> For 2) and 3) we can use an actual union if we decide to not support
> both at the same time, keyed off a flag outside the field, but if not
> we simply need space for both.
> 

Right, if there were space, we probably would have kept both.
But particularly for these two types (temperature and placement) it's 
probably fine if one overwrites the another. This is not automatic and 
will happen only at the behest of user. And that's something we can 
clearly document in the man page of the new fcntl. Hope that sounds fine?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
