Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E47BF3E3933
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  8 Aug 2021 08:45:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:Message-ID:
	References:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3rhIbdD7KTKViz0SGVarzYNTdXQioOmCYHBakvdRd8s=; b=ipBmLplMSdJ+UJQLnjSg5n48v
	Ys8jcmY8wocAvbcVp1irGikoUPyS0yDA9yzjjbFt4zMD8+sFPYrSOtN+UCQDrI63P7o85uq40vWy8
	u5U6AEUpc4g5Bk5y3AF9MZQIFNcCHQdoKighFMgRdC9jn4E/2wCwZplU2wnOd4UxTLE2c=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mCcYQ-0003vX-JH; Sun, 08 Aug 2021 06:45:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <prvs=8470769c3=damien.lemoal@opensource.wdc.com>)
 id 1mCcYL-0003v9-K1
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 Aug 2021 06:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rQXUnhkFcK3QRTMXIMVo653+EVkGKlpyGV8wyW7L424=; b=jT1jKPBMP90ftZhAVVYv6Z3fiM
 LRU8hApgFuVqvHkVYkVi5g6JPzUXyChZW/My/T9IZMQtulUbWt2n6m42JKgDB0QVc3SwWAAtVTume
 /ROBGar5Lep84TF/E6fslNQ4jlgu8ahO23BwXX+LKj7jbpeXrBQwkOwzo4yRtzRJss0Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rQXUnhkFcK3QRTMXIMVo653+EVkGKlpyGV8wyW7L424=; b=XRDbA/3klQvpwM6nNKDpJ1z4/k
 4L53QdoN2efpjBLdXTymYyGqNhw/y6/G1ctjCxFllicJY/mWc53dK/CDxllNgxIDd+5K01gBEjhTr
 IFoh90JgltFOGQ/Sx/O9F+OnreMXgwqo6rt+VXSp4Q5AgGQ7SEmvV9UaGnE5vFbkNIig=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mCcYD-00GYbO-CE
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 Aug 2021 06:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628405090; x=1659941090;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=3GAC1Q1eyioWTbceJCqnnOuPi53DrTVF6wRNqBUDPwU=;
 b=p71MUMupqa/l/UqgqiHia5KnDkSGkWYyZMV5eAGonmFOfFlut2LvM0uJ
 VdxdAf9PMg3HyMRzIx/WKEibOVxKlx/Rz+NkifodnsVJUyIh3rROp8Kxn
 Jw4+rJGK7bOvK0e0+oW2sWDx46R39jeUPRvtiHXuuMvxqpQZTdtYnl5lc
 ABsUr5VUdLNtInWPeQp8O1b5YCf7khbAu2/VVV7R03mGs7tI0LhPmdtlN
 TtAfp6C428vPqCQqFunAyj5ERNaWRrH6ld4PxqZL1j0hPHJoo9rai/sOM
 g2K887uYng4uQF6VFcoOC/jWbbYns/a2dQxjPuxa/5wL8gfbZYbKXGFSN A==;
X-IronPort-AV: E=Sophos;i="5.84,304,1620662400"; d="scan'208";a="177161089"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Aug 2021 14:29:12 +0800
IronPort-SDR: P5uwYeERpSJl4nNBddWnOFrCAL+9lUV5dJO/j7a4AbVNeCWBSxnsPl0RYclBw2akNfLWwq03w3
 xBZucAU+2NHg5U5b++thR639VWdKkOWlszl1vzl9ft8uFBjItI6k5QmpO4HTJdcRLKgOj8lKCr
 KusbOYNChTwqbdJbR40AgIxN98i7sE+JNR6bptztTjhksjpgR57c6fzvjgFKVz2WlixEmyS5NL
 +I4HahkT4DpRCHffRMIc17cNKPJ1cX/iiDEPdR9vmBYHrQ2I321L1h9HasYB93w8YV4yexxZHF
 nr2wBY6Jsxn2HxAj2vSa8KtS
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2021 23:04:46 -0700
IronPort-SDR: 7/+GZxV35b4YpKUONxt9XrX7M/jx4VOABclisM5/bYD6+v2V8nLT4pHSSU7a2CRi2PBNbC3zd/
 bUDFYXgjq7slUsmnLYfHhtu5jbS4J1a+y/ippT3o/ryKkyJU35nSertdFSF3YyZ66asf2yyN/S
 wvvavbBm5gv+yFrfVAPiD0oQHdScLvHfaolkAmFk/njGgRTsGbFOqzANLd461HP6uKaFx91hxn
 c+t9B6yD2E3pF+4atrxBechQnD27AFnlLw4P7RzG3EOfuCAub3XD0oo0NBW6+njVqr8I0VC6je
 eOs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2021 23:29:12 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gj8SR2T2Bz1RvlM
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  7 Aug 2021 23:29:11 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-language
 :content-type:in-reply-to:mime-version:user-agent:date
 :message-id:organization:from:references:to:subject; s=dkim; t=
 1628404150; x=1630996151; bh=3GAC1Q1eyioWTbceJCqnnOuPi53DrTVF6wR
 NqBUDPwU=; b=iSMFNrC0RjlpU7HT24FoAgDrjFQm+Qs/a7M1tOiYpyGWMoZYMvc
 qEZCjnEN2NLLPdANrPJ5diihsqPcGmCEE85GJSvg6KQG3knJxzSSmYlAP3eHEF+t
 I/tWDkH/fpctQnOluM7rhPQPd75neJ5vm0R50nmLQMBSICU0UYYa5yVp66zHdDAB
 iU85BPPqc6Elac44IObBuXmUD8uw8UpnXxU+NZM3zeSqFfAto5GXYTzM3QxRjO7A
 w9mFvws0U0PmNnIybErLXIK5colf7YnGSRy4jkD+mjcE0l9JfyfrAowBVb6Wu7vN
 qQ3CGeqbm0DyST/Gm7O1mqNICWVGiO4u6GQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DrYCp0JNNuYK
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  7 Aug 2021 23:29:10 -0700 (PDT)
Received: from [10.225.48.54] (unknown [10.225.48.54])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gj8SP5KDrz1RvlC;
 Sat,  7 Aug 2021 23:29:09 -0700 (PDT)
To: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-block@vger.kernel.org, Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
References: <20210806111857.488705-1-damien.lemoal@wdc.com>
 <20210806111857.488705-4-damien.lemoal@wdc.com>
 <5f2640c5-0712-b822-9ac7-3daa974c0c30@kernel.dk>
Organization: Western Digital
Message-ID: <e98cdc46-a58e-2c20-b0ab-5a93c4bf66c0@opensource.wdc.com>
Date: Sun, 8 Aug 2021 15:29:08 +0900
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <5f2640c5-0712-b822-9ac7-3daa974c0c30@kernel.dk>
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
X-Headers-End: 1mCcYD-00GYbO-CE
Subject: Re: [f2fs-dev] [PATCH v3 3/4] block: rename IOPRIO_BE_NR
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

On 2021/08/08 1:16, Jens Axboe wrote:
> On 8/6/21 5:18 AM, Damien Le Moal wrote:
>> diff --git a/include/uapi/linux/ioprio.h b/include/uapi/linux/ioprio.h
>> index abc40965aa96..99d37d4807b8 100644
>> --- a/include/uapi/linux/ioprio.h
>> +++ b/include/uapi/linux/ioprio.h
>> @@ -31,9 +31,9 @@ enum {
>>  };
>>  
>>  /*
>> - * 8 best effort priority levels are supported
>> + * The RT and BE priority classes both support up to 8 priority levels.
>>   */
>> -#define IOPRIO_BE_NR	8
>> +#define IOPRIO_NR_LEVELS	8
> 
> That might not be a good idea, if an application already uses
> IOPRIO_BE_NR...

Hmmm. include/uapi/linux/ioprio.h is being introduced with kernel 5.15. These
definition are not UAPI level right now.

What about something like this:

#define IOPRIO_NR_LEVELS	8
#define IOPRIO_BE_NR		IOPRIO_NR_LEVELS

To keep IOPRIO_BE_NR ?

OR,

Keep IOPRIO_BE_NR as is in include/uapi/linux/ioprio.h and add

#define IOPRIO_NR_LEVELS	IOPRIO_BE_NR

in include/linux/ioprio.h ?

Both would still allow doing some cleanup kernel side.

Or I can just drop this patch too.

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
