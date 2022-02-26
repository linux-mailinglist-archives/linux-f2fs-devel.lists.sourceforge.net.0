Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 190AB4C537A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Feb 2022 03:56:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nNnGF-0000r9-Dw; Sat, 26 Feb 2022 02:56:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <yebin10@huawei.com>) id 1nNnGD-0000r2-GL
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 26 Feb 2022 02:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:CC:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7RBBubQndNvzLmflXjiW8idtyTEmg/MT81ZkTwk2o9k=; b=fg/iSGtBzWYGh/MYNFvJAng0N6
 8nF2icHMmjwf0rlHGQySRJ6eO4WNLshbxhCPp+fyzk3C1wkCpRlkuUaM6+ZpTqw9Cwj2dzFqhgXQI
 PIuNEwjuR58A25GlaiGkNcQ2RBpDUTVhCXvuDEdoAFaHJkO5PS26tcSaKjm5UbcIP1wc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:CC:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7RBBubQndNvzLmflXjiW8idtyTEmg/MT81ZkTwk2o9k=; b=JvUYJAM2lwZkYu84iVnYhyRspl
 q/PexBbItdtZMzztRvnoWFm7w559B3kf0s15iAszX/B7w+IMD5PLQoqbCPFskEsF68vC0hVcFDMjG
 boup8RL/s0v6w/gE4cu34nRP91T800rY0bhqwiSwS9eo/p8Vt4uoNnI7kPXs9rjtysuQ=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nNnGA-00FVpv-G0
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 26 Feb 2022 02:56:39 +0000
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4K5B4T61Mczbbsw;
 Sat, 26 Feb 2022 10:51:53 +0800 (CST)
Received: from [10.174.178.185] (10.174.178.185) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 26 Feb 2022 10:56:27 +0800
To: Theodore Ts'o <tytso@mit.edu>
References: <20220211093527.3335518-1-yebin10@huawei.com>
 <YhmPKVrVHhTeKOzl@mit.edu>
Message-ID: <621996DB.1030501@huawei.com>
Date: Sat, 26 Feb 2022 10:56:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <YhmPKVrVHhTeKOzl@mit.edu>
X-Originating-IP: [10.174.178.185]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/2/26 10:23, Theodore Ts'o wrote: > On Fri, Feb 11,
 2022 at 05:35:27PM +0800, Ye Bin wrote: >> Now if read directory block failed, 
 'ext4_empty_dir' will return true, assume >> directory is empt [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [45.249.212.187 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nNnGA-00FVpv-G0
Subject: Re: [f2fs-dev] [PATCH -next v2] ext4:fix file system corrupted when
 rmdir non empty directory with IO error
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
From: yebin via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: yebin <yebin10@huawei.com>
Cc: jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 lczerner@redhat.com, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2022/2/26 10:23, Theodore Ts'o wrote:
> On Fri, Feb 11, 2022 at 05:35:27PM +0800, Ye Bin wrote:
>> Now if read directory block failed, 'ext4_empty_dir' will return true, assume
>> directory is empty. Obviously, it will lead to above issue.
>> To solve this issue, if read directory block failed 'ext4_empty_dir' just assume
>> directory isn't empty. To avoid making things worse when file system is already
>> corrupted, 'ext4_empty_dir' also assume directory isn't empty.
>> To distinguish the error type, return the exact error code to the caller.
>>
> Does the same issue exist for f2fs and ubifs?  We could solve the
> specific bug much more simply by having ext4_empty_dir() return FALSE
> if we aren't able to read the directory block.  Yes, it means that we
> don't return as specific an error code in the case of an I/O error ---
> although I believe we do syslog a warning --- but it makes for a much
> simpler patch that doesn't requiring getting acked-by's from the
> fscrypt, f2fs and ubifs folks.
>
> 							- Ted
> .
In fact,  I only modified ext4 as you suggested in my v1 patch.
[-next] ext4:fix file system corrupted when rmdir non empty directory 
with IO error :
https://patchwork.ozlabs.org/project/linux-ext4/patch/20220209112819.3072220-1-yebin10@huawei.com/

>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
