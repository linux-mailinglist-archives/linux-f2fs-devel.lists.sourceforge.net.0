Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE7C73995F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jun 2023 10:23:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qCFb9-0004Ir-EY;
	Thu, 22 Jun 2023 08:23:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <michael.opdenacker@bootlin.com>) id 1qCFaz-0004Ij-Jn
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jun 2023 08:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qq2xivVBQ/vsgoR8b67OJHCPmEEr+TjMVpDPALbRwnU=; b=H1TtjAVemwWu7WjAMX7n+Utdxa
 5qE7XmEd086wAwr+MHu6u1EU3cPUpcgUlDbYxOUb3slZgfbxGy4TrULKvWDJwWeCgfd5CXQNJSEeY
 gNfPdN+iQf3sNmztpI6EcmrMdTLcTOSapns4GzcMIrbuYC76hJenOP8uO9vka8wKTiHQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qq2xivVBQ/vsgoR8b67OJHCPmEEr+TjMVpDPALbRwnU=; b=NY1jvBXnVVRx3n+tHt+oR+m+qV
 ASHcOqAwxRA/FSQLGzhA0aDOqjw3oiW9fmMTG0+w9wwt0kh0AQeFOaJWv986y5tBXtqUHN0ojCsoA
 yR0fBV2G/iGkDpku8Z8QmEZszK72yNMK8HiX+nSm34zaVgoXmap2SX8siMHPi+wSB9RE=;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qCFas-00BJGm-2T for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jun 2023 08:23:13 +0000
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1687422179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qq2xivVBQ/vsgoR8b67OJHCPmEEr+TjMVpDPALbRwnU=;
 b=JcLvRHawffVQTTLRD5uBVqSjPteM6jq/Xsvhj3yuH7iqpHpTF8kj0Dq/NDm7LQfEUzLp7J
 CFIY8OoH8tnL2ThxiD0bzLr5otRwcAyvvd3fgkoL1Uzgt5niiLQsZObeyZQFELpj7Su1zp
 lfecuVHz92ZKIHOLS0zP9FZTl1gCj///XMl4CgwInOK7Kk6X7zsySShNmGpi3UdkwQWcaa
 NRGHX8cv22ofsNDd2f//1ltUAIJsMj2OhBOrJp5eU+ngBKeTder7IcmTD0hRuqO+zavvhT
 HyTt0bkMVXbg7gjSegal1tfuo3xbdtH2Mf5kkHU9JI1fwSEXat7LNcqyRYeHUg==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CA2FC000C;
 Thu, 22 Jun 2023 08:22:59 +0000 (UTC)
Message-ID: <88573ac4-5d00-d558-9b4b-00aa9adfc5f1@bootlin.com>
Date: Thu, 22 Jun 2023 10:22:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <7cea747b-0255-669f-fdfa-932f275d09c7@bootlin.com>
 <ZJPwjvlz6Rwhc3ry@google.com>
Organization: Bootlin
In-Reply-To: <ZJPwjvlz6Rwhc3ry@google.com>
X-Spam-Score: -1.0 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, Many thanks for the tips! On 22.06.23 at 08:56, Jaegeuk
 Kim wrote: > Hi, > > On 06/21, Michael Opdenacker via Linux-f2fs-devel wrote:
 >> Greetings, >> >> I'm trying to compare the performance of the various
 compression options [...] 
 Content analysis details:   (-1.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [217.70.183.198 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [217.70.183.198 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qCFas-00BJGm-2T
Subject: Re: [f2fs-dev] Trying to use compression options in f2fs
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
From: Michael Opdenacker via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

Many thanks for the tips!

On 22.06.23 at 08:56, Jaegeuk Kim wrote:
> Hi,
>
> On 06/21, Michael Opdenacker via Linux-f2fs-devel wrote:
>> Greetings,
>>
>> I'm trying to compare the performance of the various compression options in
>> f2fs versus the default settings, on an SD card.
>>
>> Here's what I'm doing:
>>
>>   * Creating the filesystem:
>>     mkfs.f2fs -f -l data -O compression,extra_attr /dev/mmcblk0p3
>>   * Mounting the filesystem:
>>     mount -o compress_algorithm=zstd:22 /dev/mmcblk0p3 /mnt/data
> This doesn't try to compress any file. Do we want to compress what files?
> That can be specified by the extention name like:
> # mount -o compress_extension=bar,compress_algorithm=zstd:22 ...
>
> Or, you can set compression flag:
> # touch foo.bar
> # chattr +c foo.bar
> # write() to foo.bar

Actually, I was looking for a way to compress all files by default, and 
I overlooked "compress_extension=*" which should work for all files, in 
particular the binaries in the root filesystem which don't have any 
particular extension.

Thanks again
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
