Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA9C4E8C95
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Mar 2022 05:25:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nYfst-0003TF-Ux; Mon, 28 Mar 2022 03:25:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nYfst-0003T9-A3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Mar 2022 03:25:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mwPbcXALF1dWWnJPry2/JPR+UcxCp6GLQ9X6DsUCb/k=; b=kFH7Kfga8GXRaZmhM3HPJdJYEU
 kT+ccbwvZxK9r+Gt4990iwMAowhk9Vd/CKiPuBdTqXbzfR1frac01w1rJ2/ypBLfftrUIeu7GD1au
 YtQD8XgSl4bzoD/Y7ykd4/3QAkxvw+4bgrrXcBvGzxhmajQri1gNgFXSx30pjdDsX56E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mwPbcXALF1dWWnJPry2/JPR+UcxCp6GLQ9X6DsUCb/k=; b=jUeZvIdYAoywbxiWQQVVbw35p+
 Z+rZX7GaZvb95/dzT3rzFvgoapyW4Cu/wMYd5ns0uqam/klfj/5uf1ViGsK7eEgHiQ6B++/gquFb1
 hJZVvmtc2PSKdTd+8mOb/WbYRkZZXorZHO9QkFTG4Pci2EMPg5ESveycCRm7knFx81LM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nYg0i-00EEy5-U0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Mar 2022 03:25:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4A737B80DAC;
 Mon, 28 Mar 2022 03:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688FBC340EE;
 Mon, 28 Mar 2022 03:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648437923;
 bh=/RJMcxuG7JdW0tU/9sgpJM0A5p6hGeXX124yaUAWNc4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jdDntPNVXyHSTeFAcdzoX93PJ3izioTKMlfc4blO3pQLXogKF+OtsVqdVS1Ianu0Q
 0YxATV7LdSZyC3BJ6xIQAKNTPdf64X/hJfYne5Nlf/6E37pP28yc1wO/HoWpgBbdbQ
 1EuiqoTVXn6OhGg6oUCVahPozCXR6N1e57D7cbV29uK28Qg22VWPQVXjKIYKoMsCgo
 ZWwu7tLnG92am3HKSLi+Z3Bzs3d9bj40Im9gjfyiIMudUEIWIcv9tGQEwzhj9w8Gtq
 wsXNkvCWQzQM3KJDQGSZqtltEZYhCB5/tkcBJ5HzPoVNoBgrUNfcjkNElfVPr9yjVj
 jq4jrZxM4UYMw==
Message-ID: <e8811d37-8987-cca5-78f5-9d17beff3a1d@kernel.org>
Date: Mon, 28 Mar 2022 11:25:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Tomas Mudrunka <mudrunka@spoje.net>
References: <f4e22b0dff793f75b5c37a170acba03c@spoje.net>
 <b491875c-c6a8-1243-35cf-649be3250b5d@kernel.org>
 <7f4d6d15166e4df14a42fa7a3bc7e914@spoje.net>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <7f4d6d15166e4df14a42fa7a3bc7e914@spoje.net>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/26 0:02, Tomas Mudrunka wrote: > Dne 2022-03-21
 07:03, Chao Yu napsal: >> Hi Tomas, >> Can sload.f2fs satisfy this requirement?
 >> Thanks, > > BTW it worked, so we've already added F2FS supp [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nYg0i-00EEy5-U0
Subject: Re: [f2fs-dev] F2FS support in genimage
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/3/26 0:02, Tomas Mudrunka wrote:
> Dne 2022-03-21 07:03, Chao Yu napsal:
>> Hi Tomas,
>> Can sload.f2fs satisfy this requirement?
>> Thanks,
> 
> BTW it worked, so we've already added F2FS support to genimage:
> 
> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fpengutronix%2Fgenimage%2Fpull%2F185&amp;data=04%7C01%7Cchao.yu%40oppo.com%7C4c4542946f1847d929e108da0e78ef11%7Cf1905eb1c35341c5951662b4a54b5ee6%7C0%7C0%7C637838210787573814%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Or%2Bt4bFIjSXQJFY9cpmo%2BxolyvMwsR3ymW%2B2BcVJeyk%3D&amp;reserved=0
> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fpengutronix%2Fgenimage%2F&amp;data=04%7C01%7Cchao.yu%40oppo.com%7C4c4542946f1847d929e108da0e78ef11%7Cf1905eb1c35341c5951662b4a54b5ee6%7C0%7C0%7C637838210787573814%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=suJsCc9%2BfDM66JUFC4GhPSORMBxkuYWCvX8Jw4dQuME%3D&amp;reserved=0
> 
> Someone might find that helpful

Thanks for the work. :)

Thanks,

> 
> Cheers
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
