Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D59720C7E9
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jun 2020 14:30:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:MIME-Version:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NHQhxTYqoTUlC7wK8OQYroFL+O+lebcun6BD38zEdRg=; b=mJtI1ZGzanqkW7hMZLn8hl/UF
	lphFWMJttWYc8PLJTUYJms7b2f7KMi1Ebt7qSsU2Ol9Jd3LV6MU1KZMSAgei3k3iqrMaslhrz/unE
	hV2f7+5klprtcuCsbTENTVpjmPmmNaQlcWHyEbhTIjnTqvP/GwocH8CWKn4u7ANn5groY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpWS1-0004gr-QS; Sun, 28 Jun 2020 12:30:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <fishland@aliyun.com>) id 1jpWS0-0004gj-9G
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 12:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:MIME-Version:Subject:Message-ID:Reply-To:Cc:To:From:Date:Sender:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sH03hTFqmDVjhI8loaQg5nJzKY2DqrJKmMiAVEC5sUU=; b=aqKg3f2hzs4eRXk/ipyNMkouPl
 fW0R76yM0Ki07uPZF1dQHwB9FlSVH3WvAIV3AOrwX0MVhOHoVhxYRiVomK3awlHrscX+BSDDkOpq1
 FI+Ts/2+/UiuCN/m7WTvnfNsN6dx/KVLoysnXIBRf526ZZE2SmdMiikGkWnn/MlYT9L4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 MIME-Version:Subject:Message-ID:Reply-To:Cc:To:From:Date:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sH03hTFqmDVjhI8loaQg5nJzKY2DqrJKmMiAVEC5sUU=; b=apvyCQkdBnBfE/tvW6Ajg+t+Nr
 oVWL0MspqSBhr6LlhVoDfXlh2HEcKUllzWvoAfyAZQLWdfdwUBgeba50baENVkg6Q92Gww6Mxsk1G
 gqJhz79LHjsot6hvJ/DFmZmeUTYdQ8MO6ABRagHd1x10H/dYPo7ZuYf0Gg7KWGCszXqc=;
Received: from out30-41.freemail.mail.aliyun.com ([115.124.30.41])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpWRw-000gns-36
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 12:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliyun.com; s=s1024;
 t=1593347411; h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type;
 bh=sH03hTFqmDVjhI8loaQg5nJzKY2DqrJKmMiAVEC5sUU=;
 b=Ax4/JNVd/R8iNe6PwgZtkp6URHgI0vCA5XK6F3Gdq+n5Uv0Rahlz4DA1GAKEIlAWu0Afb6BV/9JQqZalFM7R+F5zjHTdil5+nWUFQNqvu5bC+z/B+UV76RhZQRbeDpgGBq0Eb5ZxcBJGzBUvWWhb2iOYVFkh3CC4qJulNoF6/i4=
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1371255|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0159984-0.00139003-0.982612;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01e04357; MF=fishland@aliyun.com; NM=1; PH=DW; RN=6;
 RT=6; SR=0; TI=W4_5899425_v5_0AB1019C_1593347186243_o7001c265; 
Received: from WS-web
 (fishland@aliyun.com[W4_5899425_v5_0AB1019C_1593347186243_o7001c265]) by
 e01e01451.eu6 at Sun, 28 Jun 2020 20:30:10 +0800
Date: Sun, 28 Jun 2020 20:30:10 +0800
To: "Chao Yu" <yuchao0@huawei.com>, "jaegeuk" <jaegeuk@kernel.org>,
 "chao" <chao@kernel.org>
Message-ID: <75274a7f-2dbb-44cc-9384-5550d44f56df.fishland@aliyun.com>
X-Mailer: [Alimail-Mailagent][W4_5899425][v5][Chrome]
MIME-Version: 1.0
References: <20200626143927.2792-1-fishland@aliyun.com>,
 <34a73209-8384-2818-b6e1-c97fc9c32e69@huawei.com>
x-aliyun-mail-creator: W4_5899425_v5_AoSTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV09XNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83OC4wLjM5MDQuMTA4IFNhZmFyaS81MzcuMzY=zN
In-Reply-To: <34a73209-8384-2818-b6e1-c97fc9c32e69@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (fishland[at]aliyun.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.124.30.41 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [115.124.30.41 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: zte.com.cn]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jpWRw-000gns-36
Subject: Re: [f2fs-dev] 
 =?utf-8?q?=5BPATCH=5D_f2fs=3A_remove_unnecessary_judg?=
 =?utf-8?q?ments_in_=5F=5Finsert=5Ffree=5Fnid=28=29?=
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

>On 2020/6/26 22:39, Liu Song via Linux-f2fs-devel wrote:
>> From: Liu Song <liu.song11@zte.com.cn>
>> 
>> The value of state must be equal to FREE_NID, so the if
>> condition judgment can be removed.
>> 
>> Signed-off-by: Liu Song <liu.song11@zte.com.cn>
>> ---
>>  fs/f2fs/node.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>> 
>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>> index 03e24df1c84f..0adeb20f19c9 100644
>> --- a/fs/f2fs/node.c
>> +++ b/fs/f2fs/node.c
>> @@ -2118,8 +2118,7 @@ static int __insert_free_nid(struct f2fs_sb_info *sbi,
>>  
>>   f2fs_bug_on(sbi, state != i->state);
>>   nm_i->nid_cnt[state]++;
>> - if (state == FREE_NID)
>> -  list_add_tail(&i->list, &nm_i->free_nid_list);
>> + list_add_tail(&i->list, &nm_i->free_nid_list);
>
>In previous design, @state allow accepting both FREE_NID and PREALLOC_NID,
>If you remove that condition, it's not correct to add free nid entry into
>free_nid_list when passing PREALLOC_NID in @state, now, we only pass @state
>with FREE_NID, so it's better to remove that parameter directly.
>
>Thanks,
>
>>   return 0;
>>  }
>>  
>>

Thanks for your suggestions, I will resubmit a patch as suggested.

Thanks

Liu Song


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
