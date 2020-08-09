Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F139723FD4B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  9 Aug 2020 10:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:MIME-Version:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F7wGIYhd3ptdvuk7mf0ctFtVG+4JjUWYmjKc2U2fN6Y=; b=dZwLLZo36oSaDT/3X1yUkEOga
	VUNfX7ABsYveRLbNzG5fPc2PzESs5kZSbATTtJJWnn2vUDLXOnlEXAGfsmN6GuLqZXJEp2Tb+98pf
	/HeyIaw8iKAwG0je8lKuU5FyugEWJU7+TeYmpjmBtaioGOG4B0TvxfjletyRcfxh/1tUA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k4gQo-00044G-AY; Sun, 09 Aug 2020 08:11:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <fishland@aliyun.com>) id 1k4gQm-00043r-LE
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 09 Aug 2020 08:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:MIME-Version:Subject:Message-ID:Reply-To:Cc:To:From:Date:Sender:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WaWrPpi24z4JBZmLtbHgcGUuOU6VQ5inLugH4jU6A1o=; b=HC8xepLzywI6fv/ky6d8BJFLaE
 t/6wNe8Y9mG6zHWJ/ss3GC7ny10470AlHVHCUtmqQluuw+eBwu23KNKTUAFwxytLsHTMe3WdSLx+Z
 r7Dpz8+meeHtrd6d7aRUd4Vy1Ma91VHgEU0RGYhssZFj9MFLaQ2mEAbcekZQlKm6bVm8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 MIME-Version:Subject:Message-ID:Reply-To:Cc:To:From:Date:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WaWrPpi24z4JBZmLtbHgcGUuOU6VQ5inLugH4jU6A1o=; b=bkkHn0A1tsEvSw4XIVm+Od7H5R
 7WUS94imSlQ7G+mCB0IQEYA/XkBAOOr91pOMs0JR7d8C2D0pIaztfhzCGcj38ov2dmeesEPLhaeTH
 VubNCK5tlAWsPtn0g2aBuuZX9K0ehoKZ4FlAewb7BmCnuhUbv8Y/vcQz7B2ftQSUvh2Y=;
Received: from out30-50.freemail.mail.aliyun.com ([115.124.30.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k4gQj-00BwF4-N2
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 09 Aug 2020 08:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliyun.com; s=s1024;
 t=1596960698; h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type;
 bh=WaWrPpi24z4JBZmLtbHgcGUuOU6VQ5inLugH4jU6A1o=;
 b=l+JhuNolBIypYHO8D2gXv4Ol2AOE4SQ3SUBcAnkwqDQtAkFcMr6uEyzKHDTSwWrKAEGP3m8nAtIfFvYnB5mjMi3ZRlkSHOP3t7opwDnnnyBwWyZ4ocrCHsV2Eu2X+yJ+1BJ51V3dCRYXVISO/YAiox+gw+KL8BOGLmklpUUWIL8=
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08215642|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0177874-0.00216376-0.980049;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01e04407; MF=fishland@aliyun.com; NM=1; PH=DW; RN=6;
 RT=6; SR=0; TI=W4_5948689_v5_0AB101C3_1596960565318_o7001c78q; 
Received: from WS-web
 (fishland@aliyun.com[W4_5948689_v5_0AB101C3_1596960565318_o7001c78q]) by
 e01e01422.eu6 at Sun, 09 Aug 2020 16:11:37 +0800
Date: Sun, 09 Aug 2020 16:11:37 +0800
To: "Chao Yu" <yuchao0@huawei.com>, "jaegeuk" <jaegeuk@kernel.org>,
 "chao" <chao@kernel.org>
Message-ID: <f8bbac05-8b27-463b-9681-92a7ce127410.fishland@aliyun.com>
X-Mailer: [Alimail-Mailagent][W4_5948689][v5][Chrome]
MIME-Version: 1.0
References: <20200806150317.34618-1-fishland@aliyun.com>,
 <ea87263e-57d9-7521-6094-9aa7e1796f07@huawei.com>
x-aliyun-mail-creator: W4_5948689_v5_AoSTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV09XNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NC4wLjQxNDcuMTA1IFNhZmFyaS81MzcuMzY=zN
In-Reply-To: <ea87263e-57d9-7521-6094-9aa7e1796f07@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: zte.com.cn]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (fishland[at]aliyun.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.124.30.50 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [115.124.30.50 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k4gQj-00BwF4-N2
Subject: Re: [f2fs-dev] 
 =?utf-8?q?=5BPATCH=5D_f2fs=3A_remove_unnecessary_judg?=
 =?utf-8?q?ment_in_f2fs=5Fdrop=5Finode?=
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
From: fishland via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: fishland <fishland@aliyun.com>
Cc: linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>,
 "liu.song11" <liu.song11@zte.com.cn>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>> From: Liu Song <liu.song11@zte.com.cn>
>> 
>> Inode hash has been removed in "make_bad_inode". If inode_unhashed
>> is false, it must not be a bad inode.
>> 
>> Signed-off-by: Liu Song <liu.song11@zte.com.cn>
>> ---
>>   fs/f2fs/super.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 20e56b0fa46a..ee01d15effe3 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -1043,7 +1043,7 @@ static int f2fs_drop_inode(struct inode *inode)
>>     *       - inode_wait_for_writeback(inode)
>>     */
>>    if ((!inode_unhashed(inode) && inode->i_state & I_SYNC)) {
>
>Since logic of "bad inode should be removed from hash" is not controlled by
>f2fs, so let's add below condition to make sure the rule of vfs is as it is.

Very reasonable, thank you for your reply :D

Thanks
Liu Song

>
>f2fs_bug_on(sbi, is_bad_inode(inode));
>
>> -  if (!inode->i_nlink && !is_bad_inode(inode)) {
>> +  if (!inode->i_nlink) {
>>      /* to avoid evict_inode call simultaneously */
>>      atomic_inc(&inode->i_count);
>>      spin_unlock(&inode->i_lock);
>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
