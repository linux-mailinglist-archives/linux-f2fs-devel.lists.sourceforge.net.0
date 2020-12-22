Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 964CF2E08F0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Dec 2020 11:49:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1krfEX-0006F7-Jk; Tue, 22 Dec 2020 10:49:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1krfER-0006Eg-UV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Dec 2020 10:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PnGocLtDkiKceaUp8bda5SphKRbvcRPyghnUBKPLgpE=; b=fQvdQ6PYlF0/e3kVgvTfREpdU5
 o7z7yrnRw4WrByY2QgAWQ+JTd+d/Cy2UmA7DwmfudW4cL5bZxiN0OhFT02meivZTYby0yhTXJj8iK
 3jyIwNhTeyzkLK6lw+LZYjskxcE4iqZnCE8Z3xbDeb/OHfo/tQDSAmp8gTRuKDdPrx9g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PnGocLtDkiKceaUp8bda5SphKRbvcRPyghnUBKPLgpE=; b=h45Cn9d8uKYZxMZHOZSdG02J3n
 ZmsV66DrHyGTq5He6Jvr9Yt3bqRFtsdGe9SNAU5/v8GH1kXmmdDAbbLQHIhP1jfPoP6M40Hf50J8s
 e5F1kyqDsJzO7NvOV1tUfiz4BCp2lRAtxLQmwscWTgo2mOBmpaB6rBh+ySH/CsKJAWfg=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1krfED-004e3M-OS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Dec 2020 10:49:31 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D0Y3C5mzfzhYM4;
 Tue, 22 Dec 2020 18:48:23 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 22 Dec
 2020 18:49:02 +0800
To: Weichao Guo <guoweichao@oppo.com>, <jaegeuk@kernel.org>, <chao@kernel.org>
References: <1607918093-204-1-git-send-email-guoweichao@oppo.com>
 <7129ad3d-cf60-2106-dcd6-783ec7470620@huawei.com>
 <c537b5d4-5e1a-956f-bc46-f8b608468984@oppo.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <41642a06-f629-bf5e-96b4-412473447c31@huawei.com>
Date: Tue, 22 Dec 2020 18:49:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <c537b5d4-5e1a-956f-bc46-f8b608468984@oppo.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1krfED-004e3M-OS
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

On 2020/12/22 17:32, Weichao Guo wrote:
> =

> On 2020/12/22 16:24, Chao Yu wrote:
>> On 2020/12/14 11:54, Weichao Guo wrote:
>>> We should update the ~S_IRWXUGO part of inode->i_mode in __setattr_copy,
>>> because posix_acl_update_mode updates mode based on inode->i_mode,
>>> which finally overwrites the ~S_IRWXUGO part of i_acl_mode with old
>>> i_mode.
>>>
>>> Testcase to reproduce this bug:
>>> 0. adduser abc
>>> 1. mkfs.f2fs /dev/sdd
>>> 2. mount -t f2fs /dev/sdd /mnt/f2fs
>>> 3. mkdir /mnt/f2fs/test
>>> 4. setfacl -m u:abc:r /mnt/f2fs/test
>>> 5. chmod +s /mnt/f2fs/test
>>>
>>> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
>>> Signed-off-by: Bin Shu <shubin@oppo.com>
>>> ---
>>>  =A0 fs/f2fs/file.c | 1 +
>>>  =A0 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index 16ea10f..4d355f9 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -850,6 +850,7 @@ static void __setattr_copy(struct inode *inode,
>>> const struct iattr *attr)
>>>  =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!in_group_p(inode->i_gid) && !capa=
ble(CAP_FSETID))
>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode &=3D ~S_ISGID;
>>> +=A0=A0=A0=A0=A0=A0=A0 inode->i_mode =3D (inode->i_mode & S_IRWXUGO) | =
(mode &
>>> ~S_IRWXUGO);
>>
>> Sorry, I still have problem with this patch.
>>
>> I think this equals to inode->i_mode =3D mode;
>>
>> Because in chmod_common(), @mode was assigned as:
>>
>> newattrs.ia_mode =3D (mode & S_IALLUGO) | (inode->i_mode & ~S_IALLUGO);
> =

> Hi Chao,
> =

> I think this means=A0 all bits of S_IALLUGO can be changed during chmod(),
> and i_acl_mode has

Hi Weichao,

Correct,

> =

> new S_IRWXUGO bits , i_mode has old S_IRWXUGO bits.

Look into acl related code again, I found what f2fs now do is trying to
update i_mode and acl xattr entry atomically, so in advance updated mode
will be record to i_acl_mode, and finally, it will update i_mode w/ i_acl_m=
ode
while acl entry update in path of f2fs_set_acl() - f2fs_setxattr().

In order to keep this rule, I think we need to change as below, let me know
if I missed something.

From: Weichao Guo <guoweichao@oppo.com>
Subject: [PATCH] f2fs: fix to set inode->i_mode correctly for
  posix_acl_update_mode

---
  fs/f2fs/acl.c   | 23 ++++++++++++++++++++++-
  fs/f2fs/xattr.c | 15 +++++++++------
  2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
index 1e5e9b1136ee..732ec10e7890 100644
--- a/fs/f2fs/acl.c
+++ b/fs/f2fs/acl.c
@@ -200,6 +200,27 @@ struct posix_acl *f2fs_get_acl(struct inode *inode, in=
t type)
  	return __f2fs_get_acl(inode, type, NULL);
  }

+static int f2fs_acl_update_mode(struct inode *inode, umode_t *mode_p,
+			  struct posix_acl **acl)
+{
+	umode_t mode =3D inode->i_mode;
+	int error;
+
+	if (is_inode_flag_set(inode, FI_ACL_MODE))
+		mode =3D F2FS_I(inode)->i_acl_mode;
+
+	error =3D posix_acl_equiv_mode(*acl, &mode);
+	if (error < 0)
+		return error;
+	if (error =3D=3D 0)
+		*acl =3D NULL;
+	if (!in_group_p(inode->i_gid) &&
+	    !capable_wrt_inode_uidgid(inode, CAP_FSETID))
+		mode &=3D ~S_ISGID;
+	*mode_p =3D mode;
+	return 0;
+}
+
  static int __f2fs_set_acl(struct inode *inode, int type,
  			struct posix_acl *acl, struct page *ipage)
  {
@@ -213,7 +234,7 @@ static int __f2fs_set_acl(struct inode *inode, int type,
  	case ACL_TYPE_ACCESS:
  		name_index =3D F2FS_XATTR_INDEX_POSIX_ACL_ACCESS;
  		if (acl && !ipage) {
-			error =3D posix_acl_update_mode(inode, &mode, &acl);
+			error =3D f2fs_acl_update_mode(inode, &mode, &acl);
  			if (error)
  				return error;
  			set_acl_inode(inode, mode);
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 65afcc3cc68a..2086bef6c154 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -673,7 +673,7 @@ static int __f2fs_setxattr(struct inode *inode, int ind=
ex,
  		}

  		if (value && f2fs_xattr_value_same(here, value, size))
-			goto exit;
+			goto same;
  	} else if ((flags & XATTR_REPLACE)) {
  		error =3D -ENODATA;
  		goto exit;
@@ -738,17 +738,20 @@ static int __f2fs_setxattr(struct inode *inode, int i=
ndex,
  	if (error)
  		goto exit;

-	if (is_inode_flag_set(inode, FI_ACL_MODE)) {
-		inode->i_mode =3D F2FS_I(inode)->i_acl_mode;
-		inode->i_ctime =3D current_time(inode);
-		clear_inode_flag(inode, FI_ACL_MODE);
-	}
  	if (index =3D=3D F2FS_XATTR_INDEX_ENCRYPTION &&
  			!strcmp(name, F2FS_XATTR_NAME_ENCRYPTION_CONTEXT))
  		f2fs_set_encrypted_inode(inode);
  	f2fs_mark_inode_dirty_sync(inode, true);
  	if (!error && S_ISDIR(inode->i_mode))
  		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
+
+same:
+	if (is_inode_flag_set(inode, FI_ACL_MODE)) {
+		inode->i_mode =3D F2FS_I(inode)->i_acl_mode;
+		inode->i_ctime =3D current_time(inode);
+		clear_inode_flag(inode, FI_ACL_MODE);
+	}
+
  exit:
  	kfree(base_addr);
  	return error;
-- =

2.29.2



> =

> BR,
> =

> Weichao
> =

>>
>> and only S_ISUID and S_ISGID bits of newattrs.ia_mode can be changed
>> during chmod()
>>
>> That's why setattr_copy() in fs/attr.c just uses "inode->i_mode =3D mode=
;"
>>
>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0 set_acl_inode(inode, mode);
>>
>> Another problem is if i_acl_mode is used for error path handling, here
>> i_acl_mode
>> and i_mode have the same value, that's not correct?
>>
>> Jaegeuk,
>>
>> IIUC, i_acl_mode was introduced for i_mode recovery once acl progress
>> fails?
>>
>> Thanks,
>>
>>>  =A0=A0=A0=A0=A0 }
>>>  =A0 }
>>>
> .
> =



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
