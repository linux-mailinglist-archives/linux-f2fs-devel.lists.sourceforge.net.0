Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBA03E3938
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  8 Aug 2021 08:47:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:Message-ID:
	References:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9emZfh7OlR5WJ8fKl9Bxss/ZFWBNZxnxOeuBEFI2tfQ=; b=WQ5eHJ3oC5QcQdArnhA32dLTQ
	7T/a1+8w9rPB6lJd8I2vUM7I4v04rco9aSL9VvPkxFoVX5dWcG6yZquUoxG2fcdZEt5ECzEk0vJx3
	JiLFxeqdESSxT04jMv1yTzSFQ9FuNft9EW5jUDBb/JzfusYlqvf55LKUZbnx0Bzajekl4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mCcb6-00043T-Kp; Sun, 08 Aug 2021 06:47:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <prvs=8470769c3=damien.lemoal@opensource.wdc.com>)
 id 1mCcb4-00043H-Jq
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 Aug 2021 06:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PmD8Jhn5G+z6OasJTzyh7gNJEt1oCKBOeor3u0zGxWU=; b=jEztRSsRtQmn8jiVEYZDPlKNO2
 HD2Q9egmrwZ26Y9eTTGoTx3QD0Tw5fGFXfwakm9fWcPP6jIxjnWkQJ4rQ0DRYST7xOg+TwQ3vr2G+
 IchiUnuQRPUpiQttg+ovHMErG6g8AuItLn93O7iSMf2md8lMDVNq02MUrLwVJpIXKRYA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PmD8Jhn5G+z6OasJTzyh7gNJEt1oCKBOeor3u0zGxWU=; b=TkLgYWooZhhm+YQ0UDVp6UYnNA
 qdkRmxW23NgdH8o2aowyI+x44y89WUbTOvN/SJEbd+vE/190rYhYX8zboTvSMJHcXbM3KzD+1y4HB
 Gb5BMiH9+xFedPJ7Bs7jq9gY2jWHmgoM2M7cOM74DSEnrj6x982wgpXZHM9achgmq6Xc=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mCcax-0007i0-CW
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 Aug 2021 06:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628405260; x=1659941260;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=ZUKKExjkwoKwlQDbiX2Ci8kvte+LdrWVT0+BHiCgXTM=;
 b=B1h9K75mXIlYH5x1REtq6CbWJKOEHKQPU1j8CfXWBY58VVIRzWUwzVx1
 imTKaC0HIrLQ/EHR5Tj08X/HzDp0OzIPkbRRo1hQ2zGeq3xNk8OKU6RIV
 mEkD1AKmTyp4ETOkN4MC78kJvrrPGqByNJ9MiCfWWYOMEhn9Jhg3z/dCD
 T01ZqtBdAHHU4jEGgR8ntJaQjRz256GGUfiNMfk5aPG+sKRFx2hu5c4VI
 RmDLXXe6UKn4wZDmTyrROp9YUz11BqMkZ07ujD4TFcDPOvMehqvKf2sYu
 Q9TXHUUsGNyEOa6ftpO0voG+WdjV/4FgIfsNyOmtXLa1O5Kx1SWiAV2bw A==;
X-IronPort-AV: E=Sophos;i="5.84,304,1620662400"; d="scan'208";a="177161170"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Aug 2021 14:32:05 +0800
IronPort-SDR: tGbsIeMdB4BlmKNofqi8xxiaQnk+Szgj9ph9Nnu67QTQpzDvrxYwtA4vC++paUvZcHUlpxJaiK
 A9imR53w6AwwFfo6tuA8PDFTv7V2Nv/c+0ZlL6PzUtJ9d+Hg7mEnCNq66elaIisBzzCLmF5R7F
 LkaVWqA9dU6CHV0j6K+6Xp/dlV9TcXkb9S167wMSINC6QYTH32QzhngAXdPPQmoFGxpn6RrjdQ
 mOzLwlVb9FjzkCQdFGQ37c6pXQkebrDANtjr1xKggygDQixpvN+PHLtoX9DwPOgP4blfDO10xq
 K7mvtPAufllqYkh88hXExYhs
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2021 23:09:29 -0700
IronPort-SDR: W3koUfVI4ZImD1uNcdwk7fADAJBKgRp1DLb+OH8b51+WPJuA+Gjb+3b9xWR9T5+XrtydjBM1s0
 bzmQfcLhUD97Db+6bFmNJzjVj0NxInn1RCZGI9GfKt53yep00VanKMMgPGMzvWjw7kWLt59XJ0
 c+kUDhmnCY2NwVgerwVKbbeS61pgJ/XFnVG6RUHYrvr1xNpLAzURVB5Qj+6iNPr+KBVjynd/k0
 FaANy5HO8Bq723a60HuMhn9kEng25GCAvYL+OM4mcPo/VgWbLhIaNNYN/I8KWuIm7faPZkgjVe
 y6s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2021 23:32:04 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gj8Wl5J3Lz1RvlP
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  7 Aug 2021 23:32:03 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-language
 :content-type:in-reply-to:mime-version:user-agent:date
 :message-id:organization:from:references:to:subject; s=dkim; t=
 1628404321; x=1630996322; bh=ZUKKExjkwoKwlQDbiX2Ci8kvte+LdrWVT0+
 BHiCgXTM=; b=FMNNgEcxsAPBkYxmdxbCuemvjg6wlfEqjXJ01vI7wY5foawbmtH
 1iAM5ueQWX9vYmyoDaSIyLcuHQPxtCOIHvn+oBT0Ig6vftNUc+/eQHe7fB3QbRmg
 AI9gaDxVoXU0VMUARuhQyO9OUXO5p9EGOhKoNhvGhpO5YE83hSl+RyDXYMsv/alT
 7zROsS+G6r0CUDnQYjjywqliiKY3JZkE+V5Lz4drYvlmsiCNGK6fQsXwDjrjUOqF
 gl+3FAX/Dzb5hAvgqCuBRtKUG/PtV56RVLSvzwt+NfCkqsfsYvDFvA5nbEINdGmz
 pxHBFZJHVPtYkax/+G9HedE4AoFKTkOZsiA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id tIdWOVQf7uUt
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  7 Aug 2021 23:32:01 -0700 (PDT)
Received: from [10.225.48.54] (unknown [10.225.48.54])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gj8Wh4zh4z1RvlC;
 Sat,  7 Aug 2021 23:32:00 -0700 (PDT)
To: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-block@vger.kernel.org, Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
References: <20210806111857.488705-1-damien.lemoal@wdc.com>
 <20210806111857.488705-5-damien.lemoal@wdc.com>
 <4bfdceb3-36a7-c224-c1cc-ab273ab15589@kernel.dk>
Organization: Western Digital
Message-ID: <2eb8cf57-952c-7485-e7b9-8c982b379975@opensource.wdc.com>
Date: Sun, 8 Aug 2021 15:31:59 +0900
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <4bfdceb3-36a7-c224-c1cc-ab273ab15589@kernel.dk>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mCcax-0007i0-CW
Subject: Re: [f2fs-dev] [PATCH v3 4/4] block: fix default IO priority
 handling
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
From: Damien Le Moal via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/08/08 1:19, Jens Axboe wrote:
> On 8/6/21 5:18 AM, Damien Le Moal wrote:
>> diff --git a/include/uapi/linux/ioprio.h b/include/uapi/linux/ioprio.h
>> index 99d37d4807b8..5b4a39c2f623 100644
>> --- a/include/uapi/linux/ioprio.h
>> +++ b/include/uapi/linux/ioprio.h
>> @@ -42,8 +42,8 @@ enum {
>>  };
>>  
>>  /*
>> - * Fallback BE priority
>> + * Fallback BE priority level.
>>   */
>> -#define IOPRIO_NORM	4
>> +#define IOPRIO_BE_NORM	4
> 
> This again seems like a very poor idea.

OK. Will remove that. Or we could do:

#define IOPRIO_NORM	4
#define IOPRIO_BE_NORM	IOPRIO_NORM

In case other classes want to set a different default... Though, that is not
critical I think.

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
