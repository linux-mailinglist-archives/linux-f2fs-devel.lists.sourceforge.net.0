Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8162B72B93B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jun 2023 09:53:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8cMP-0005Rv-AB;
	Mon, 12 Jun 2023 07:53:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <beomsu7.kim@samsung.com>) id 1q8cMN-0005Rk-37
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 07:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=URaC+fwzwBBWdu87ez64/DWs/qxRMF1AQRsVSgmOwoM=; b=fPUu0LPcs6DSoAHpRoG19yXPGt
 DxsEpg3zTPhJ3KNmMxtN1Wpg74QO/RG9j/0SiTkQhS76fBL1/EOuK4CSwYfw5zZbhN6MMYk6CVdkF
 mEb+qVXg3WbJp+fJgYeslC9mV93hViAjdDXZBKhmV1q8LGGdFmV1NXTtk/vRZYXjxfN0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=URaC+fwzwBBWdu87ez64/DWs/qxRMF1AQRsVSgmOwoM=; b=NkT7xVzvaRx0XM3ljA15grBsET
 WN2AhxBbJJLqFRQJbe0NZ7Gx10Ol8io6rkLa11O85YgF+DhKKN7ZUH2vhPwsBHw/1Oeaiczvdxu20
 AugHkApReKEYaZeAP8jRRnJpG3OaBeaCe/PTmrWA8Dud6jHbRiBXgYnXFxeKdDf4oZzA=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8cMI-000VOU-9p for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 07:53:07 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20230612075251epoutp0250ad3071b23b10e2c2c420c3f4634d4b~n2hWhv5lQ1684416844epoutp02i
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Jun 2023 07:52:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20230612075251epoutp0250ad3071b23b10e2c2c420c3f4634d4b~n2hWhv5lQ1684416844epoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1686556371;
 bh=URaC+fwzwBBWdu87ez64/DWs/qxRMF1AQRsVSgmOwoM=;
 h=Subject:Reply-To:From:To:In-Reply-To:Date:References:From;
 b=q2XSW5c4dKbZMDdN+GugjF1JRDhhWxJU0Paqcqb74ENF5a/l1SOS6PVImTVPPC5is
 F0+3WwhYyilkZfGQE9/5sHRV1oj68aaEAqo03QcuigIz7P9hMWNcXTzs8rNeWjkUma
 WUXNT9Vn4Q8xJKW7J/rKOmKsxfnVFmWnNw6eOtK0=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20230612075251epcas2p3a7f046b80cc23f5f28fb5dd4b031bcff~n2hWCgJMr2111021110epcas2p3q;
 Mon, 12 Jun 2023 07:52:51 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.89]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4QfkSL6GG2z4x9Q9; Mon, 12 Jun
 2023 07:52:50 +0000 (GMT)
X-AuditID: b6c32a48-c3ff87000000acbc-ef-6486ced2ce9e
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 0F.BE.44220.2DEC6846; Mon, 12 Jun 2023 16:52:50 +0900 (KST)
Mime-Version: 1.0
From: beomsu kim <beomsu7.kim@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Yonggil Song <yonggil.song@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>, Daejun Park
 <daejun7.park@samsung.com>, Seonghun Kim <seonghun-sui.kim@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <f301845f-c358-4632-1df5-5944d7483072@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230612075250epcms2p7d2e02243caa54d4a9ceb525a2b23d555@epcms2p7>
Date: Mon, 12 Jun 2023 16:52:50 +0900
X-CMS-MailID: 20230612075250epcms2p7d2e02243caa54d4a9ceb525a2b23d555
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgk+LIzCtJLcpLzFFi42LZdljTVPfSubYUg8XdWhanp55lslj1INzi
 yfpZzBaXFrlbXN41h83i9Q85i1Udcxktpp4/wuTA4bFpVSebx+4Fn5k8+rasYvT4vEkugCUq
 2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6AYlhbLE
 nFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToF5gV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbG
 3C0LWAoOC1ccmfCQrYFxI18XIyeHhICJxIMz/cxdjFwcQgI7GCXmPp7L1MXIwcErICjxd4cw
 SI2wgLfE6hv/WUBsIQFFib7mDWwgJcICOhJLthiDhNkEtCS6r58BGyMi0MEssW/7W0aI+bwS
 M9qfskDY0hLbl28Fi3MK2Ek8b/vADhHXkPixrJcZwhaVuLn6LTuM/f7YfKg5IhKt985C1QhK
 PPi5GyouIfH652WoeL7E998fGUGOkBBoYZTY2TMHKqEvse3PbLAjeAV8JV40bGQFeYBFQFVi
 79xsiBIXiY+794OVMAvIS2x/C9LKAWRrSqzfpQ9iSggoSxy5BVXBJ9Fx+C87zIc75j1hgihR
 legGBQ472LMdBhAFHhIfH91ggQTxSUaJmT0XWScwKsxChPIsJFtnIWxdwMi8ilEstaA4Nz21
 2KjABB6xyfm5mxjBSVHLYwfj7Lcf9A4xMnEwHmKU4GBWEuHVNmlOEeJNSaysSi3Kjy8qzUkt
 PsRoCvTuRGYp0eR8YFrOK4k3NLE0MDEzMzQ3MjUwVxLn/dihnCIkkJ5YkpqdmlqQWgTTx8TB
 KdXA5LM0lfnUyrbt5cIvmFbsPPPQISPtVb3f4xcVxWkT1r5c+jDn5Paj18pm9iZuWjM/e93P
 G1Znfrtqyxrs9WGqaZN6q8Nqu5vtBLMIS1bnQaXzki5qec5/Lks5ssyZHSTxbPrK2VdLNAQ5
 K+V6N7/9zB0pW62wzvR7oYL2U9V7F3OWipb0Sb7Iyzn+SY8xL3TV5Jr1vN8LPn+tfrikutJu
 a/yne1ckyhyW2jAnz/vPnb/t5mtt69uyJ5m8YxJ81ndWfTey+3jQa11++aL7SQpF7y/7BEjd
 FziyZfUr2VtKl4PYtSw/ZhZxCG3US5t42vfdj6ITK3bET+Tg4L9o+7vUYZKRxfcFEp69Pxi/
 1tzwVGIpzkg01GIuKk4EAIpujO8TBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230602044830epcms2p141ec782e866c2adc5a3142516f051b87
References: <f301845f-c358-4632-1df5-5944d7483072@kernel.org>
 <20230602044830epcms2p141ec782e866c2adc5a3142516f051b87@epcms2p1>
 <CGME20230602044830epcms2p141ec782e866c2adc5a3142516f051b87@epcms2p7>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/2 12:48, beomsu kim wrote: >> When evaluating in
 f2fs, it takes much time to obtain waf data. >> This patch helps to obtain
 waf data without calcluation. >> >> Signed-off-by: Beomsu Kim <beo [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q8cMI-000VOU-9p
Subject: Re: [f2fs-dev] (2) [PATCH] f2fs: including waf data in f2fs status
 information
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
Reply-To: beomsu7.kim@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/6/2 12:48, beomsu kim wrote:
>> When evaluating in f2fs, it takes much time to obtain waf data.
>> This patch helps to obtain waf data without calcluation.
>> 
>> Signed-off-by: Beomsu Kim <beomsu7.kim@samsung.com>
>> ---
>>   fs/f2fs/iostat.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>> 
>> diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
>> index 3d5bfb1ad585..6eab11b0610d 100644
>> --- a/fs/f2fs/iostat.c
>> +++ b/fs/f2fs/iostat.c
>> @@ -34,10 +34,22 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
>>   {
>>          struct super_block *sb = seq->private;
>>          struct f2fs_sb_info *sbi = F2FS_SB(sb);
>> +       int j;
>> +       unsigned long long waf = 0;
>> +       unsigned long long data_written_to_storage = 0;
>> +       unsigned long long data_written_by_user = 0;
>>   
>>          if (!sbi->iostat_enable)
>>                  return 0;
>>   
>> +       for (j = FS_DATA_IO; j <= FS_CP_META_IO; j++)
>
>FS_CDATA_IO is redundant?

I agree, and modified it.
		
>
>> +               data_written_to_storage += sbi->iostat_bytes[j];
>> +       for (j = FS_DATA_IO; j <= FS_CDATA_IO; j++)
>
>Just needs to include APP_WRITE_IO and APP_MAPPED_IO?

There is a slight time interval between requests in the form of APP_*_IO until they become requests in the form of FS_*_IO. On the other hand, we get the amount of file system meta data from FS_*_IO for 'data_written_to_storage'. So, If we use APP_*_IO for 'data_written_by_user', the 'waf' value returned during this time interval might have some difference from the actual value.

>
>Thanks,
>
>> +               data_written_by_user += sbi->iostat_bytes[j];
>> +
>> +       if (data_written_by_user > 0)
>> +               waf = data_written_to_storage * 100 / data_written_by_user;
>> +
>>          seq_printf(seq, "time:          %-16llu\n>", ktime_get_real_seconds());
>>          seq_printf(seq, "\t\t\t%-16s %-16s %-16s\n>",
>>                                  "io_bytes", "count", "avg_bytes");
>> @@ -81,6 +93,10 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
>>          IOSTAT_INFO_SHOW("fs discard", FS_DISCARD_IO);
>>          IOSTAT_INFO_SHOW("fs flush", FS_FLUSH_IO);
>>   
>> +       /* print waf */
>> +       seq_puts(seq, "[WAF]\n>");
>> +       seq_printf(seq, "fs waf:                %llu.%02llu\n>", waf / 100, waf % 100);
>> +
>>          return 0;
>>   }
>> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
