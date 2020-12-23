Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8095B2E1112
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Dec 2020 02:14:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1krsjS-0005nN-0Q; Wed, 23 Dec 2020 01:14:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1krsjQ-0005n7-3U
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Dec 2020 01:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jsKcydUGQliDHg/icDj+f7ltBFOHppwl2xAQ1i742yE=; b=cauCFC95b0hQCJNtt8UDOa9koq
 4v8ipmOkoLtoS6jL2Tod9VPJI+p5BF/2llztRrMbeYe02FrHtWz7Y01EHcDBH+/eqF92ana9RKg8v
 deYAv8x67Ju9xBIvvHqrrlvBFlRUC0YbceDDXs41YU06hZ3VrxrG0w2iUCmgvRZ7+oDk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jsKcydUGQliDHg/icDj+f7ltBFOHppwl2xAQ1i742yE=; b=VSiBYvg0T6PgjDSK0w3B+6Sg3R
 EjuMtc/F/d0JN3wgFsfs4Utd6VGnvxWs5NELm8brMNo3DnkLD0TYzr7hzkyV+qlOiqXVTWI2DlO0A
 Q01ezwDxmPTStFDJ4fT8xpO0MHqZiMNGWoMa1VJMACGWeDus+yJ+r65PzfHJ6r62uF4Y=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1krsjF-0070No-Gp
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Dec 2020 01:14:24 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D0wFD0SbVz15hBG;
 Wed, 23 Dec 2020 09:13:20 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 23 Dec
 2020 09:14:01 +0800
To: Weichao Guo <guoweichao@oppo.com>, <jaegeuk@kernel.org>, <chao@kernel.org>
References: <1607918093-204-1-git-send-email-guoweichao@oppo.com>
 <7129ad3d-cf60-2106-dcd6-783ec7470620@huawei.com>
 <c537b5d4-5e1a-956f-bc46-f8b608468984@oppo.com>
 <41642a06-f629-bf5e-96b4-412473447c31@huawei.com>
 <a2a4ab3b-e5a1-0b55-e094-06508c1f2a01@oppo.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <16f46413-0c94-12d4-09bb-dcc26a670a7d@huawei.com>
Date: Wed, 23 Dec 2020 09:14:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <a2a4ab3b-e5a1-0b55-e094-06508c1f2a01@oppo.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1krsjF-0070No-Gp
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to set inode->i_mode correctly for
 posix_acl_update_mode
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
Cc: fh@oppo.com, Bin Shu <shubin@oppo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/22 20:14, Weichao Guo wrote:
> =

> On 2020/12/22 18:49, Chao Yu wrote:
>> On 2020/12/22 17:32, Weichao Guo wrote:
>>>
>>> On 2020/12/22 16:24, Chao Yu wrote:
>>>> On 2020/12/14 11:54, Weichao Guo wrote:
>>>>> We should update the ~S_IRWXUGO part of inode->i_mode in
>>>>> __setattr_copy,
>>>>> because posix_acl_update_mode updates mode based on inode->i_mode,
>>>>> which finally overwrites the ~S_IRWXUGO part of i_acl_mode with old
>>>>> i_mode.
>>>>>
>>>>> Testcase to reproduce this bug:
>>>>> 0. adduser abc
>>>>> 1. mkfs.f2fs /dev/sdd
>>>>> 2. mount -t f2fs /dev/sdd /mnt/f2fs
>>>>> 3. mkdir /mnt/f2fs/test
>>>>> 4. setfacl -m u:abc:r /mnt/f2fs/test
>>>>> 5. chmod +s /mnt/f2fs/test
>>>>>
>>>>> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
>>>>> Signed-off-by: Bin Shu <shubin@oppo.com>
>>>>> ---
>>>>>  =A0=A0 fs/f2fs/file.c | 1 +
>>>>>  =A0=A0 1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>>> index 16ea10f..4d355f9 100644
>>>>> --- a/fs/f2fs/file.c
>>>>> +++ b/fs/f2fs/file.c
>>>>> @@ -850,6 +850,7 @@ static void __setattr_copy(struct inode *inode,
>>>>> const struct iattr *attr)
>>>>>  =A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!in_group_p(inode->i_gid) && =
!capable(CAP_FSETID))
>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode &=3D ~S_ISGID;
>>>>> +=A0=A0=A0=A0=A0=A0=A0 inode->i_mode =3D (inode->i_mode & S_IRWXUGO) =
| (mode &
>>>>> ~S_IRWXUGO);
>>>>
>>>> Sorry, I still have problem with this patch.
>>>>
>>>> I think this equals to inode->i_mode =3D mode;
>>>>
>>>> Because in chmod_common(), @mode was assigned as:
>>>>
>>>> newattrs.ia_mode =3D (mode & S_IALLUGO) | (inode->i_mode & ~S_IALLUGO);
>>>
>>> Hi Chao,
>>>
>>> I think this means=A0 all bits of S_IALLUGO can be changed during chmod=
(),
>>> and i_acl_mode has
>>
>> Hi Weichao,
>>
>> Correct,
>>
>>>
>>> new S_IRWXUGO bits , i_mode has old S_IRWXUGO bits.
>>
>> Look into acl related code again, I found what f2fs now do is trying to
>> update i_mode and acl xattr entry atomically, so in advance updated mode
>> will be record to i_acl_mode, and finally, it will update i_mode w/
>> i_acl_mode
>> while acl entry update in path of f2fs_set_acl() - f2fs_setxattr().
> =

> Hi Chao,
> =

> IMO, only the S_IRWXUGO of part of i_mode needs update with acl xattr
> entry atomically.

I don't get the point, IMO, all S_IALLUGO bits of i_mode and acl entries
should be updated atomically.

> =

>>
>> In order to keep this rule, I think we need to change as below, let me
>> know
>> if I missed something.
>>
> If we change as below, "chmod +s dir" may be failed if ACL related code
> occurs=A0 some error. However,
> =

> this command should be successful , which is irrelevant with ACL.

Will below appended change make sense to you? If posix_acl_chmod() failed,
just bail out w/o updating i_mode.

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5bcaa68f74ad..8998fddde3e4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -950,10 +950,9 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *=
attr)

  	if (attr->ia_valid & ATTR_MODE) {
  		err =3D posix_acl_chmod(inode, f2fs_get_inode_mode(inode));
-		if (err || is_inode_flag_set(inode, FI_ACL_MODE)) {
-			inode->i_mode =3D F2FS_I(inode)->i_acl_mode;
+
+		if (is_inode_flag_set(inode, FI_ACL_MODE))
  			clear_inode_flag(inode, FI_ACL_MODE);
-		}
  	}

> =

> BR,
> =

> Weichao
> =

>> From: Weichao Guo <guoweichao@oppo.com>
>> Subject: [PATCH] f2fs: fix to set inode->i_mode correctly for
>>  =A0posix_acl_update_mode
>>
>> ---
>>  =A0fs/f2fs/acl.c=A0=A0 | 23 ++++++++++++++++++++++-
>>  =A0fs/f2fs/xattr.c | 15 +++++++++------
>>  =A02 files changed, 31 insertions(+), 7 deletions(-)
>>
>> diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
>> index 1e5e9b1136ee..732ec10e7890 100644
>> --- a/fs/f2fs/acl.c
>> +++ b/fs/f2fs/acl.c
>> @@ -200,6 +200,27 @@ struct posix_acl *f2fs_get_acl(struct inode
>> *inode, int type)
>>  =A0=A0=A0=A0 return __f2fs_get_acl(inode, type, NULL);
>>  =A0}
>>
>> +static int f2fs_acl_update_mode(struct inode *inode, umode_t *mode_p,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct posix_acl **acl)
>> +{
>> +=A0=A0=A0 umode_t mode =3D inode->i_mode;
>> +=A0=A0=A0 int error;
>> +
>> +=A0=A0=A0 if (is_inode_flag_set(inode, FI_ACL_MODE))
>> +=A0=A0=A0=A0=A0=A0=A0 mode =3D F2FS_I(inode)->i_acl_mode;
>> +
>> +=A0=A0=A0 error =3D posix_acl_equiv_mode(*acl, &mode);
>> +=A0=A0=A0 if (error < 0)
>> +=A0=A0=A0=A0=A0=A0=A0 return error;
>> +=A0=A0=A0 if (error =3D=3D 0)
>> +=A0=A0=A0=A0=A0=A0=A0 *acl =3D NULL;
>> +=A0=A0=A0 if (!in_group_p(inode->i_gid) &&
>> +=A0=A0=A0=A0=A0=A0=A0 !capable_wrt_inode_uidgid(inode, CAP_FSETID))
>> +=A0=A0=A0=A0=A0=A0=A0 mode &=3D ~S_ISGID;
>> +=A0=A0=A0 *mode_p =3D mode;
>> +=A0=A0=A0 return 0;
>> +}
>> +
>>  =A0static int __f2fs_set_acl(struct inode *inode, int type,
>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct posix_acl *acl, struct page=
 *ipage)
>>  =A0{
>> @@ -213,7 +234,7 @@ static int __f2fs_set_acl(struct inode *inode, int
>> type,
>>  =A0=A0=A0=A0 case ACL_TYPE_ACCESS:
>>  =A0=A0=A0=A0=A0=A0=A0=A0 name_index =3D F2FS_XATTR_INDEX_POSIX_ACL_ACCE=
SS;
>>  =A0=A0=A0=A0=A0=A0=A0=A0 if (acl && !ipage) {
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 error =3D posix_acl_update_mode(inode=
, &mode, &acl);
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 error =3D f2fs_acl_update_mode(inode,=
 &mode, &acl);
>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (error)
>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return error;
>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 set_acl_inode(inode, mode);
>> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
>> index 65afcc3cc68a..2086bef6c154 100644
>> --- a/fs/f2fs/xattr.c
>> +++ b/fs/f2fs/xattr.c
>> @@ -673,7 +673,7 @@ static int __f2fs_setxattr(struct inode *inode,
>> int index,
>>  =A0=A0=A0=A0=A0=A0=A0=A0 }
>>
>>  =A0=A0=A0=A0=A0=A0=A0=A0 if (value && f2fs_xattr_value_same(here, value=
, size))
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto exit;
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto same;
>>  =A0=A0=A0=A0 } else if ((flags & XATTR_REPLACE)) {
>>  =A0=A0=A0=A0=A0=A0=A0=A0 error =3D -ENODATA;
>>  =A0=A0=A0=A0=A0=A0=A0=A0 goto exit;
>> @@ -738,17 +738,20 @@ static int __f2fs_setxattr(struct inode *inode,
>> int index,
>>  =A0=A0=A0=A0 if (error)
>>  =A0=A0=A0=A0=A0=A0=A0=A0 goto exit;
>>
>> -=A0=A0=A0 if (is_inode_flag_set(inode, FI_ACL_MODE)) {
>> -=A0=A0=A0=A0=A0=A0=A0 inode->i_mode =3D F2FS_I(inode)->i_acl_mode;
>> -=A0=A0=A0=A0=A0=A0=A0 inode->i_ctime =3D current_time(inode);
>> -=A0=A0=A0=A0=A0=A0=A0 clear_inode_flag(inode, FI_ACL_MODE);
>> -=A0=A0=A0 }
>>  =A0=A0=A0=A0 if (index =3D=3D F2FS_XATTR_INDEX_ENCRYPTION &&
>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 !strcmp(name, F2FS_XATTR_NAME_ENCR=
YPTION_CONTEXT))
>>  =A0=A0=A0=A0=A0=A0=A0=A0 f2fs_set_encrypted_inode(inode);
>>  =A0=A0=A0=A0 f2fs_mark_inode_dirty_sync(inode, true);
>>  =A0=A0=A0=A0 if (!error && S_ISDIR(inode->i_mode))
>>  =A0=A0=A0=A0=A0=A0=A0=A0 set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
>> +
>> +same:
>> +=A0=A0=A0 if (is_inode_flag_set(inode, FI_ACL_MODE)) {
>> +=A0=A0=A0=A0=A0=A0=A0 inode->i_mode =3D F2FS_I(inode)->i_acl_mode;
>> +=A0=A0=A0=A0=A0=A0=A0 inode->i_ctime =3D current_time(inode);
>> +=A0=A0=A0=A0=A0=A0=A0 clear_inode_flag(inode, FI_ACL_MODE);
>> +=A0=A0=A0 }
>> +
>>  =A0exit:
>>  =A0=A0=A0=A0 kfree(base_addr);
>>  =A0=A0=A0=A0 return error;
> .
> =



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
