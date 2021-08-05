Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A49B83E0C0F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Aug 2021 03:23:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBS69-00039d-4C; Thu, 05 Aug 2021 01:23:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mBS67-00039V-8f
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Aug 2021 01:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tBWWxfqqYdIMqXEvlGMbQgGCsmqwtZ5w3Qr+zF0rOtk=; b=SK8cpTFC4z8cOWafb7q4aBGIfD
 CrGfgjUAfCZEPlJqgzkHj8Q9zbLTrLDL+NXkV6PiK4kiFKEUEf4Y4PehBYy3vgpZmODiWL8cd1uBD
 /aQWdzlzu90pjlCrZzi0xfUBmPBjBb1TJtBPmls9+PQuUVRnkdWDri4FjXr6v1cARc7k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tBWWxfqqYdIMqXEvlGMbQgGCsmqwtZ5w3Qr+zF0rOtk=; b=D4/NxRHxDDKMcj3dgFWP/a6ymN
 DEcMKo2fh3SH9nWseOKCm4KNyYyLBTwZnQGHra5nkCMpsWjie1HyD+/4PLhw1bCIePC5mpMBkz5V2
 +BWsjlIYF7PSfVt7hxRCEN8gc63Sgxc8/aDEbhSBAcqxXQHO7CptyVh2DkUlfdv7qDh0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBS65-0003kw-DP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Aug 2021 01:22:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9CD560F58;
 Thu,  5 Aug 2021 01:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628126572;
 bh=gTjIpI1FpLUDK6STnG9eLGnDt1bnnSC4qvZu+spsCTs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FqDX/iFs6JQffpoQiyezVvMibM4g4RFdK6AbbAVdadlxIHIIt0ehOep8DnM8XEVY7
 pIwZZPJ0MGWr6SpReTO/3fKvNNnonCWNHkigqLrUZ+txxmqtjN33JZNVBlfT+l7GTs
 6cgaS5iKzy8fDHdr+tnlBDypRaRvEuR5kLf801BVatBsee8SVfXayd0EhyWPAk1Whi
 58jrf7iZmz6/Q/b+akO2BBDUcN7LOzTGaoHkc7BWaK/JK8juAxmDoRLZdkZ9GUI/Xm
 SCc5x6X1D8LzCJ1KH3GCbIBmeK8g2k9OBtcgCo+/Cw+unmGEv9W3YydizJayGcPiU8
 5yDXIJHyNuGiQ==
To: Christoph Hellwig <hch@infradead.org>
References: <20210730100530.4401-1-chao@kernel.org>
 <YQqbhMtVZvCF30r9@infradead.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <1204887a-7724-7891-2db5-6f710b595781@kernel.org>
Date: Thu, 5 Aug 2021 09:22:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQqbhMtVZvCF30r9@infradead.org>
Content-Language: en-US
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mBS65-0003kw-DP
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce nosmall_discard mount option
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
Cc: jaegeuk@kernel.org, Chao Yu <chao.yu@linux.dev>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/4 21:52, Christoph Hellwig wrote:
> On Fri, Jul 30, 2021 at 06:05:30PM +0800, Chao Yu wrote:
>> This patch introduces a new mountoption "nosmall_discard" to support
>> disabling small discard functionality, note that the mountoption can not
>> be removed by remount() due to related metadata should always be
>> initialized during mount().
> 
> Why does this need an option?  It should be enable IFF and only IFF a
> SMR drive is detected.
> 

We've updated this patch as below:

@@ -1961,10 +1998,13 @@ static void default_options(struct f2fs_sb_info *sbi)
  	sbi->sb->s_flags |= SB_LAZYTIME;
  	set_opt(sbi, FLUSH_MERGE);
  	set_opt(sbi, DISCARD);
-	if (f2fs_sb_has_blkzoned(sbi))
+	if (f2fs_sb_has_blkzoned(sbi)) {
  		F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
-	else
+		F2FS_OPTION(sbi).discard_unit = DISCARD_UNIT_SECTION;
+	} else {
  		F2FS_OPTION(sbi).fs_mode = FS_MODE_ADAPTIVE;
+		F2FS_OPTION(sbi).discard_unit = DISCARD_UNIT_BLOCK;
+	}

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=dev&id=4f993264fe2965c344f223d854ccbb549b16ed71

For blkzoned device, section unit based discard will be enabled by default.

For other type of devices, IMO, this is a tradeoff in between small-sized
discard support and memory overhead, so I proposed to add such mount option
to support selection from different benefit point.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
