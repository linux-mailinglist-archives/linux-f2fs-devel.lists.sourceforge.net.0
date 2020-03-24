Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAE8190397
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2020 03:32:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGZMz-0006iu-HE; Tue, 24 Mar 2020 02:32:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jGZMx-0006ih-NK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Mar 2020 02:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9ajAV89zNc2YyUfSAkfAJcelhHdThA8TXEojsfoQLYs=; b=YOiNFiF1uQvxqUqrE46y2LIzh3
 GGN31nlaKvSP3fzlLa/fSwi7SRzp/iX/shjrPRk5CxzKJtIrGsOlaVM3P6i1T6ErxMbzPlPAtDTvf
 UXSKsuHZ/mOQ/128+kueBCIUq75FeVelXUMNMOky+060HfXPpbig+/F/47c29pbz4HzQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9ajAV89zNc2YyUfSAkfAJcelhHdThA8TXEojsfoQLYs=; b=K3grtp0u7++BuaH31zp5u1Isi9
 2IsfbmmjEcb5waz1rq0dYpNSMz+KijqSdflAg2HdMSAEtS5mImygBcApnY/MtddJpcV0Oi1ee2p9N
 C8b4kQvvnmBT4VbCm/fCYQjNMXpfZGFDKLgOiNSpDjrHFRpLFHPQQFdWNhn9WsIR+3NQ=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGZMt-00Efnb-QN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Mar 2020 02:32:43 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 60D0FAE250B3DCC57A39;
 Tue, 24 Mar 2020 10:32:32 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 24 Mar
 2020 10:32:26 +0800
To: John <graysky@archlinux.us>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <CAO_nJAYw+-+n584gg2-rRp3KoAsPT5mpD5yRCrwM7hiDMD=PJg@mail.gmail.com>
 <78bdaf48-9699-3a04-efec-95e1a670bfe4@huawei.com>
 <CAO_nJAZ_bW1Bor-sUb8Ouz4VQV28KPZR23njH4VV+eH=BgwR=Q@mail.gmail.com>
 <418f4ee8-14ed-bdfa-d16c-f68c2992f234@huawei.com>
 <CAO_nJAYTbPqWKAnG1+i2J1jnEKN6QtiMV_CxVyranZ-AWK9Agg@mail.gmail.com>
 <20200323041143.GC147648@google.com>
 <CAO_nJAYEGp1129PsFwMdU0ZdjC75DoL60nXhY7KaATgSPz-2DA@mail.gmail.com>
 <20200323150205.GA119787@google.com>
 <CAO_nJAbyEcTR4wFytJp1HQmQBDzpwycKhA_-FUwo39WVMceuZw@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <8b47e963-9e12-c945-e40e-a9d54a412d52@huawei.com>
Date: Tue, 24 Mar 2020 10:32:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAO_nJAbyEcTR4wFytJp1HQmQBDzpwycKhA_-FUwo39WVMceuZw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jGZMt-00Efnb-QN
Subject: Re: [f2fs-dev] fstrim does not recognize FSVER=1.13 of F2FS
 partitions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/3/24 4:12, John wrote:
> On Mon, Mar 23, 2020 at 11:02 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>>> /dev/mapper/media-crypt /mnt/media f2fs
>>> rw,lazytime,relatime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,fsync_mode=posix
>>
>> - media-crypt means dm-crypt? Any chance to try raw sda?
> 
> Yes, it is dm-crypt.
> 
>> Could you try this?
>> - mount -o remount,nodiscard
>>  : The reason is, as f2fs uses async discard feature with -o discard, it doesn't
>>    give 0 bytes on fstrim sometimes.
> 
> I can confirm it is mounted now with the nodiscard option, but fstrim
> still claims discard is not supported.

Can you try below command and show us the result to see whether device supports discard:

strace blkdiscard -o 0 -l 4096 /dev/mapper/media-crypt

It may discard first 4k block which is first superblock of f2fs, for safety, it will
be better to backup all your data before executing the command.

Thanks,

> 
> % mount | grep crypt
> /dev/mapper/media-crypt on /mnt/media type f2fs
> (rw,relatime,lazytime,background_gc=on,nodiscard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,fsync_mode=posix,x-systemd.automount)
> 
> # fstrim -v /mnt/media
> fstrim: /mnt/media: the discard operation is not supported
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
