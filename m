Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE876B58ED6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Sep 2025 09:10:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6j0vUdHYcJ8p4n4mdRG5I70BpB3FIlx7oV8UCeqhuwI=; b=h2/+WoENC0g6A6v9BHA9X+3h7I
	vSOwuetfXSag/J48eKSR/0k14kLVvHmwOmvdSkEKbYAhcWyF+r5ZisCy1nWDE8JkmbW6HcT4e+xcT
	VaPLQ80GvracpdUsYX6qmnhx32Y8cwNTpazRnURP4oniLmDbb/tVUQG+1MoLkKw2tJvo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uyPp6-0004GG-Ek;
	Tue, 16 Sep 2025 07:09:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uyPp5-0004G3-96
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 07:09:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IvtSllYDS72dTTar+irfGZzDHyNWzuiEVqG6Dto4jQE=; b=SGTbITaTjfDzTSSuAju8/a+BF6
 HKxZBVg5a1S+1Iz7l5RHFtwEYHYPROxJWE8e6o/ccWFOa/0EnW8GjVf8oI51M3bKAG//J9NmBdPVy
 q2jy2scAlSklyNyPxvo5cXF3HYixnjc8OJ3yU+NLcpKbt30p7R1ucXBJ/ROfpRaOxcf0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IvtSllYDS72dTTar+irfGZzDHyNWzuiEVqG6Dto4jQE=; b=NvC707mUm3TMOKGJsU66+GE27E
 ChI+uPbdPvJpk7uEDIbLhddh2dEL3j7X+MMw1/gSGZOLBvSXa+/Z38HkSe0Y6C1S25DyY1WZ6niDS
 Kmo3DLNEB1rmBfPBNPenuA1nwlF7WMvdkj+RAVEvd9nmPPwjXB/Pc5rPZdwJRth2RHpI=;
Received: from mta20.honor.com ([81.70.206.69] helo=mta20.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uyPp4-0000zK-PD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 07:09:56 +0000
Received: from w002.hihonor.com (unknown [10.68.28.120])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4cQtLN5P1BzYlv4M;
 Tue, 16 Sep 2025 15:09:16 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 16 Sep
 2025 15:09:46 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 16 Sep
 2025 15:09:46 +0800
From: wangzijie <wangzijie1@honor.com>
To: <chao@kernel.org>
Date: Tue, 16 Sep 2025 15:09:46 +0800
Message-ID: <20250916070946.231825-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <f6b74555-f10c-4a8e-8caa-1797a3d7a7cf@kernel.org>
References: <f6b74555-f10c-4a8e-8caa-1797a3d7a7cf@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w003.hihonor.com (10.68.17.88) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 9/16/25 13:22, wangzijie wrote: >>> On 09/15, wangzijie
 wrote: >>>> When we get wrong extent info data, and look up extent_node in
 rb tree, >>>> it will cause infinite loop (CONFIG_F2FS_CHECK_FS=n [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [81.70.206.69 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [81.70.206.69 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uyPp4-0000zK-PD
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: fix infinite loop in
 __insert_extent_tree()
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
Cc: feng.han@honor.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 wangzijie1@honor.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>On 9/16/25 13:22, wangzijie wrote:
>>> On 09/15, wangzijie wrote:
>>>> When we get wrong extent info data, and look up extent_node in rb tree,
>>>> it will cause infinite loop (CONFIG_F2FS_CHECK_FS=n). Avoiding this by
>>>> return NULL.
>>>
>>> This is the exact buggy case which we should fix the original one. Have
>>> you seen this error? In that case, can we consider writing some kernel
>>> message and handle the error properly?
>> 
>> Hi Jaegeuk,
>> The original one is the bug I mentioned in the first patch of this patch set
>> ("f2fs: fix zero-sized extent for precache extents"). 
>
>Zijie,
>
>Did you suffer this problem in product? right?

Hi Chao,
Yes, and I can confirm that infinite loop cases I suffered are caused by the bug I
mentioned in the first patch of this patch set. But I'm not sure if there are
other cases that can cause this infinite loop.

>> 
>> When we use a wrong extent_info(zero-sized) to do update, and there exists a
>> extent_node which has same fofs as the wrong one, we will skip "invalidate all extent
>> nodes in range [fofs, fofs + len - 1]"(en->ei.fofs = end = tei->fofs + tei->len = tei->fofs),
>> which cause the infinite loop in __insert_extent_tree().
>> 
>> So we can add f2fs_bug_on() when there occurs zero-sized extent
>> in f2fs_update_read_extent_cache_range(), and give up this zero-sized
>> extent update to handle other unknown buggy cases. Do you think this will be better?
>> 
>> And do we need to solve this infinite loop?
>
>IMO, it's worth to end such loop if there is any corrupted extent in rbtree to
>avoid kernel hang, no matter it is caused by software bug or hardware flaw
>potentially.
>
>Thanks,

And do you think we need this?
"add f2fs_bug_on() when there occurs zero-sized extent in f2fs_update_read_extent_cache_range(),
and give up this zero-sized extent update to handle other unknown buggy cases".



>> 
>> 
>>>>
>>>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>>>> ---
>>>>  fs/f2fs/extent_cache.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
>>>> index 199c1e7a8..6ed6f3d1d 100644
>>>> --- a/fs/f2fs/extent_cache.c
>>>> +++ b/fs/f2fs/extent_cache.c
>>>> @@ -605,6 +605,7 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
>>>>  			leftmost = false;
>>>>  		} else {
>>>>  			f2fs_bug_on(sbi, 1);
>>>> +			return NULL;
>>>>  		}
>>>>  	}
>>>>  
>>>> -- 
>>>> 2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
