Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E77160794
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Feb 2020 02:04:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3UpK-0003VU-Uc; Mon, 17 Feb 2020 01:03:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j3UpJ-0003VN-PO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 01:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YGVKjDqZ/Ui3XMGQ6zwOwuisWOHKZwEAOeo+C+HQVyA=; b=jVUIL+5hLpQ7CgHEflinNkz4Y6
 r+eLpJ1FmD0y5Xt/OCa7D/rCr+TmL3EhbGhw0QI9e7aEBeqQeXPYHjLTz7WYQrKCg8HiyyYhkQ78W
 7EXGdcgiQOPnVs/A7o++6buLGO111OxFLN2N4nh0p8ursdbnuUvzmaXc5sL28bfztBHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YGVKjDqZ/Ui3XMGQ6zwOwuisWOHKZwEAOeo+C+HQVyA=; b=mTf6QCKPjcW/wwhopjFmOgbTTA
 o0y2oR59w8zNdRUnrJiOf5sWWgGP/0IA86Mdet5DKFWNvQGywjhGmbfWoa0ZT8R0AAl/sY9NJjPkW
 uC8NG33uNoyGhep55N87mOQ4mMLGJ5wtQ4HhUT54eqQWRKhzHR/hPl2NIid2vC52w2jQ=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j3UpH-005hPk-LP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 01:03:57 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 406B710D8A15A8CBDBB6;
 Mon, 17 Feb 2020 09:03:35 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Feb
 2020 09:03:29 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200214094413.12784-1-yuchao0@huawei.com>
 <20200214094413.12784-3-yuchao0@huawei.com>
 <20200214184150.GB60913@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c0436553-a1b6-8124-a096-15d2c3d5bd79@huawei.com>
Date: Mon, 17 Feb 2020 09:03:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200214184150.GB60913@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j3UpH-005hPk-LP
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: clean up lfs/adaptive mount option
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/2/15 2:41, Jaegeuk Kim wrote:
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 5152e9bf432b..d2d50827772c 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -91,8 +91,6 @@ extern const char *f2fs_fault_name[FAULT_MAX];
>>  #define F2FS_MOUNT_FORCE_FG_GC		0x00004000
>>  #define F2FS_MOUNT_DATA_FLUSH		0x00008000
>>  #define F2FS_MOUNT_FAULT_INJECTION	0x00010000
>> -#define F2FS_MOUNT_ADAPTIVE		0x00020000
>> -#define F2FS_MOUNT_LFS			0x00040000
> 
> I don't think we can remove this simply.
> 
>>  #define F2FS_MOUNT_USRQUOTA		0x00080000
>>  #define F2FS_MOUNT_GRPQUOTA		0x00100000
>>  #define F2FS_MOUNT_PRJQUOTA		0x00200000

You mean getting rid of this change or we need to fill F2FS_MOUNT_* hole as below:

#define F2FS_MOUNT_FAULT_INJECTION	0x00010000
-#define F2FS_MOUNT_ADAPTIVE		0x00020000
-#define F2FS_MOUNT_LFS			0x00040000
+#define F2FS_MOUNT_USRQUOTA		0x00020000
+#define F2FS_MOUNT_GRPQUOTA		0x00040000
...

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
