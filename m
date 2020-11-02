Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A9C2A237A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Nov 2020 04:28:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZQWD-0002Jv-Ta; Mon, 02 Nov 2020 03:28:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kZQWC-0002Jf-Bl
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 03:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OYT0ikjNUZipWkVRPBKGjAs0Sl0kcwCTGZ6i5NWAqOs=; b=FBib5/IziLKO4jg6MIpBSV3KLL
 pAhMUz1rBsOJFEhS0Y13afT7qIT5ikiDuiOZ2VsafT9o5f3ed9uwGFG4zCFu+9GwbxzdTlVC5aPFW
 QKAearFtIbxohlctR7TE6+YmzGYNi8It+cFHdCr3cA1rPlwU7gudZaZnIdH82hiOSx4Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OYT0ikjNUZipWkVRPBKGjAs0Sl0kcwCTGZ6i5NWAqOs=; b=U8gMh0kCllHdOhY7FaYLSXIynB
 3/dm94KHZhzMQxZsbClUd7YSzCC9hwgSpLFd3ZzO3/XkX66/NcVVoEqGWbbicShhjYX07iQjjrFga
 l/xt/xLAhb6Luo1LbDwrdSc5gRThhxBduvm8kU6WdYtlecIQZWACXB51iQV6HdkeQtnk=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZQW6-005qMJ-Mw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 03:28:28 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CPdfM5kYLzhfd5;
 Mon,  2 Nov 2020 11:28:11 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 2 Nov 2020
 11:28:12 +0800
To: Eric Biggers <ebiggers@kernel.org>, <jaegeuk@kernel.org>
References: <20200407100107.4356-1-yuchao0@huawei.com>
 <20200407100107.4356-2-yuchao0@huawei.com>
 <20201031234848.GC936@sol.localdomain>
 <95ba132f-0dc0-d391-26b4-68eef132f931@huawei.com>
 <20201102023922.GA1419858@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <951032c7-0419-921e-876c-8c8e5c59c52a@huawei.com>
Date: Mon, 2 Nov 2020 11:28:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201102023922.GA1419858@sol.localdomain>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kZQW6-005qMJ-Mw
Subject: Re: [f2fs-dev] [PATCH 2/2] fsck.f2fs: fix to check validation of
 i_xattr_nid
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
Cc: kilobyte@angband.pl, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/11/2 10:39, Eric Biggers wrote:
> On Mon, Nov 02, 2020 at 09:31:09AM +0800, Chao Yu wrote:
>> On 2020/11/1 7:48, Eric Biggers wrote:
>>> Hi Chao,
>>>
>>> On Tue, Apr 07, 2020 at 06:01:07PM +0800, Chao Yu wrote:
>>>> Otherwise, fsck.f2fs will access invalid memory address as below:
>>>>
>>>> - fsck_verify
>>>>    - dump_node
>>>>     - dump_file
>>>>      - dump_inode_blk
>>>>       - dump_xattr
>>>>        - read_all_xattrs
>>>>          - get_node_info
>>>>           access &(F2FS_FSCK(sbi)->entries[nid])
>>>>
>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>>> ---
>>>>    fsck/dump.c  |  2 ++
>>>>    fsck/fsck.c  |  8 ++++++++
>>>>    fsck/fsck.h  |  3 +++
>>>>    fsck/mount.c |  8 +++++---
>>>>    fsck/xattr.c | 20 ++++++++++++++++++--
>>>>    5 files changed, 36 insertions(+), 5 deletions(-)
>>>>
>>>
>>> This commit caused a regression where 'dump.f2fs -i <inode> <device>'
>>> now segfaults if the inode has any extended attributes.
>>>
>>> It's because read_all_xattrs() now calls fsck_sanity_check_nid(), which
>>> eventually dereferences f2fs_fsck::main_area_bitmap, which is NULL.
>>>
>>> I'm not sure what was intended here.
>>
>> Eric, could you please have a try with below commit:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/chao/f2fs-tools.git/commit/?h=dev-test&id=aad80ed0099fb9530ae3af9789362353ff580252
>>
> 
> Works for me.  I was wondering whether the fix would be more than that, but
> maybe not.

Thanks for both report and test.

I don't have any other concern on current solution, let's ask for Jaegeuk's
opinion anyway.

Jaegeuk, could you please check previous buggy fix and current fix?

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
