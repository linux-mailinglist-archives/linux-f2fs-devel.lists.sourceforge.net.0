Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86349B59655
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Sep 2025 14:37:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSnDYFRGxq3RJ0FpYRGZE9b4K9yEnSY32c9PW+/JBDo=; b=LYXQzjB1CxDqby7kRaX1K6f3ZO
	C9X0hYyuWJc+qhKtMuXiyBLjTt7OxCzQPywqt0syKCFRf53QExZkwO6vUsvVg4io1eX02A+Prn2oI
	6I72RAEjvUyuIYSZc2YC+mxeT9/c4VsxWgZgtb22/PVIR6x6PMRKm49IS6JqRbKyVtYs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uyUve-0000Xd-Na;
	Tue, 16 Sep 2025 12:37:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uyUvc-0000XJ-N0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 12:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0kGUCXBj8dH15jWtuYRrGjjZPzL1qmMxypXxdQKuCes=; b=RtLMIsG6fNCz932xc+APxvP16K
 bzOsvQ4zRyxdLZ7TdBUEsqQ5rOZQ8CQPLZGa1WbVI4P9W0E4m652BFQMtnRdbYRvXdf0+i3+oLttW
 q5va0MAwqbi9tgfErK3EXuDMu0nO09XG+OfhhXhm+SqToa2f3P3BWv7owLo8CB7RmYws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0kGUCXBj8dH15jWtuYRrGjjZPzL1qmMxypXxdQKuCes=; b=BPVHDwv4QxmQD/TBBSNUxaUS1G
 v1PDruC8BqC/zKjfd88REau7tR0BiJMTlE/Yq+2SJKySnrmdtgesSoUKwEW9irZIRGHckZjo4xw2G
 t+oXLkzRt2EZRXc0Rj+6B2Ns8Uf9nHGaQC0AzyKqI9LUqt0NfGqYaKxSd+2SD4DUxOdQ=;
Received: from mta22.hihonor.com ([81.70.192.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uyUvc-0007pu-0Q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 12:37:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=To:From;
 bh=0kGUCXBj8dH15jWtuYRrGjjZPzL1qmMxypXxdQKuCes=;
 b=FNr29e9hOoT4VcZZRWrrkGXNb4FtXH1EL0mTazXwAJQcFsO542bCyMRmuSfj/qqAuXqs7yAVA
 ZdSA459EojSMail2td9th97xrqNsypmnTd6BAWBTU8DbQLlVOZjAn1UaY2oJ8CTuSOhFSntY2O9
 9Delkr6pZkElyp9inOuAYEo=
Received: from w012.hihonor.com (unknown [10.68.27.189])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4cR1c04B1KzYl4ZT;
 Tue, 16 Sep 2025 20:36:32 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 16 Sep
 2025 20:36:52 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 16 Sep
 2025 20:36:51 +0800
From: wangzijie <wangzijie1@honor.com>
To: <chao@kernel.org>
Date: Tue, 16 Sep 2025 20:36:51 +0800
Message-ID: <20250916123651.257804-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1f80bc3f-845f-49f4-93d7-cc1be8a781f5@kernel.org>
References: <1f80bc3f-845f-49f4-93d7-cc1be8a781f5@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w011.hihonor.com (10.68.20.122) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 9/15/25 11:52,
 wangzijie wrote: >> When we get wrong extent
 info data, and look up extent_node in rb tree, >> it will cause infinite
 loop (CONFIG_F2FS_CHECK_FS=n). Avoiding this by >> return NULL. [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [81.70.192.198 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uyUvc-0007pu-0Q
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

>On 9/15/25 11:52, wangzijie wrote:
>> When we get wrong extent info data, and look up extent_node in rb tree,
>> it will cause infinite loop (CONFIG_F2FS_CHECK_FS=n). Avoiding this by
>> return NULL.
>> 
>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>> ---
>>  fs/f2fs/extent_cache.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
>> index 199c1e7a8..6ed6f3d1d 100644
>> --- a/fs/f2fs/extent_cache.c
>> +++ b/fs/f2fs/extent_cache.c
>> @@ -605,6 +605,7 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
>>  			leftmost = false;
>>  		} else {
>
>Need to print some messages here as Jaegeuk suggested, IIUC.
>
>Thanks,

OK, I will update it in next version.

>>  			f2fs_bug_on(sbi, 1);
>> +			return NULL;
>>  		}
>>  	}
>>  


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
