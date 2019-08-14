Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D078D6AC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2019 16:54:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:Message-ID:
	References:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xC0fEHxb4TzFmvY+ojmH+66yjPe87UypHDm5kUMgg14=; b=O1c0JlssTfAuIOMLUxhJUd29I3
	dbLG0ahYa6Om9kPIgLOaniB+49Sw8RwzaxKXV4s3w7dPKF5/Fc3BAAKbH6SU219dq9MlVs36hKB3k
	51aa4mj7v8TBbg73rrjd6KUaJ+1+fHZoTidwWDElAxNz5YNE+XunLa/vVpH7Wvpxrt54=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxufU-0002aN-JY; Wed, 14 Aug 2019 14:54:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <salyzyn@android.com>) id 1hxufT-0002aH-KE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 14:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CnI+bcK+PrkZXa0lXxFneGD0jULXut8K+Ere8plo5Kc=; b=M3r8bd42cDhbCbJteDVr8dpaif
 zVwOGoXXRJIOzRSwqb4SnelkAJSAUVqJr3ETW/8Vm7/TjcClQ4SCxYzq9u1B/RjLzTFd5r2DkSEli
 6a7WGVuuSKCxUQc/SCBzqMBbygoz5DofzZtbSEM9Coj6sqBgQLuuB8VInvDeodYHYe0g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CnI+bcK+PrkZXa0lXxFneGD0jULXut8K+Ere8plo5Kc=; b=NBxfSo/mn5B28FQS9dbCMT//j4
 0MsUINlfHJYAIdAR0Kj/2uWQv2SL0woKbddDe8TINTWi24VnCQA+nITkWaChUL+mTZD5fMTCiW6JI
 tPhFxD6SlSdxfP16L/z+zvXkYBPgwmLwL52t6yFMU/RGUqutOnnIA/OyKCDjbCfXtHZI=;
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hxufR-00618b-CG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 14:54:27 +0000
Received: by mail-pl1-f196.google.com with SMTP id y8so8699982plr.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Aug 2019 07:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=CnI+bcK+PrkZXa0lXxFneGD0jULXut8K+Ere8plo5Kc=;
 b=ahMJ7+6MRm+vSMGaNapJnzEVkJAGqdseEv5NiAiJ2xVM1sgCa/KjV3CzptwbORiRO4
 tdVwxwGBtUsGnUn2c7e13VySsAmWdVDIrtQOwhPmb7DJeeLmPii1ZL4rskNBRvtj47Hs
 RPxCzpXwnaU3g/CUfEBg3QlPGY1SngnQDCYWpuzQB5cndu90bUkPUFPxqy0/Rekd1WQO
 4zngI17UYs23Aiqj3B79lt987Hor3fkgPNT95mLnJes5xZMFhtrjHD+wvpp9CvYS0OOT
 T0Jx+829oyOwsEqr2Xgl3CEpOuwA5/x9WXxEUC4UDChgzDD/d77A140pfqc0MLV3w5Tr
 /pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CnI+bcK+PrkZXa0lXxFneGD0jULXut8K+Ere8plo5Kc=;
 b=gNBXhwkt03+ZTQqD30hpD9wrYlJMeP1cu9+4f1pFZtuTiiYEQ01anB/mpV4xGr+BNs
 P3KwjSXu7Ztii3R5TagCUhVihjLgbwOFgvfH/SQj0PnqHOjuOjVbC/ud+jdsdE9rTh9X
 QGI7dxWLkpPlfAj5x79ccYAuadWcitBhmClhauqTGDy6dOh99VVjq37dPAvN4JrhpJfb
 0m9B/IFhRz7UNaSI7Ddo5qaRQGU7EzrAeascWkzFaRxOvfuOA01MVss9BdYTN0QM0IHC
 ran2GBDpmE1qiwiTF9+tgZXHXtpO26wRU1ddwVGt+1ZS4TefbNMlaIzgHnUu54M3zqKw
 zEbg==
X-Gm-Message-State: APjAAAVD+T1bPNAe+4DGfyNHkzVkEdGMXRNb/1cLXGzoaHgIWaDR9pQ/
 Z+nrA2cWCwXqgQpUdpg6R+kBuw==
X-Google-Smtp-Source: APXvYqz3CwepJ0lR8OwKX1IycWhHHs06AM+yzu0iFct+XZq8bOtgfYosWIvv1z0G9d0AAh0UWfDALQ==
X-Received: by 2002:a17:902:3103:: with SMTP id
 w3mr43683432plb.84.1565794459417; 
 Wed, 14 Aug 2019 07:54:19 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
 ([2620:15c:211:200:5404:91ba:59dc:9400])
 by smtp.googlemail.com with ESMTPSA id
 f20sm144508955pgg.56.2019.08.14.07.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2019 07:54:18 -0700 (PDT)
To: Jan Kara <jack@suse.cz>
References: <20190813145527.26289-1-salyzyn@android.com>
 <20190814110022.GB26273@quack2.suse.cz>
Message-ID: <71d66fd1-cc94-fd0c-dfa7-115ba8a6b95a@android.com>
Date: Wed, 14 Aug 2019 07:54:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814110022.GB26273@quack2.suse.cz>
Content-Language: en-GB
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hxufR-00618b-CG
Subject: Re: [f2fs-dev] [PATCH v2] Add flags option to get xattr method
 paired to __vfs_getxattr
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
From: Mark Salyzyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mark Salyzyn <salyzyn@android.com>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 jfs-discussion@lists.sourceforge.net,
 Phillip Lougher <phillip@squashfs.org.uk>, linux-integrity@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org,
 Dominique Martinet <asmadeus@codewreck.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mm@kvack.org,
 Chris Mason <clm@fb.com>, netdev@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-xfs@vger.kernel.org,
 Eric Paris <eparis@parisplace.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org, Stephen Smalley <sds@tycho.nsa.gov>,
 Mike Marshall <hubcap@omnibond.com>, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Sage Weil <sage@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-unionfs@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 James Morris <jmorris@namei.org>, cluster-devel@redhat.com,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Vyacheslav Dubeyko <slava@dubeyko.com>,
 Casey Schaufler <casey@schaufler-ca.com>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 kernel-team@android.com, devel@lists.orangefs.org,
 Serge Hallyn <serge@hallyn.com>, Eric Van Hensbergen <ericvh@gmail.com>,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 Josef Bacik <josef@toxicpanda.com>, reiserfs-devel@vger.kernel.org,
 Bob Peterson <rpeterso@redhat.com>, Joel Becker <jlbec@evilplan.org>,
 Anna Schumaker <anna.schumaker@netapp.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 selinux@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, David Howells <dhowells@redhat.com>,
 linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-fsdevel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Tyler Hicks <tyhicks@canonical.com>, Steve French <sfrench@samba.org>,
 =?UTF-8?Q?Ernesto_A=2e_Fern=c3=a1ndez?= <ernesto.mnd.fernandez@gmail.com>,
 linux-btrfs@vger.kernel.org, linux-security-module@vger.kernel.org,
 Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>,
 linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>,
 ocfs2-devel@oss.oracle.com, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/14/19 4:00 AM, Jan Kara wrote:
> On Tue 13-08-19 07:55:06, Mark Salyzyn wrote:
> ...
>> diff --git a/fs/xattr.c b/fs/xattr.c
>> index 90dd78f0eb27..71f887518d6f 100644
>> --- a/fs/xattr.c
>> +++ b/fs/xattr.c
> ...
>>   ssize_t
>>   __vfs_getxattr(struct dentry *dentry, struct inode *inode, const char *name,
>> -	       void *value, size_t size)
>> +	       void *value, size_t size, int flags)
>>   {
>>   	const struct xattr_handler *handler;
>> -
>> -	handler = xattr_resolve_name(inode, &name);
>> -	if (IS_ERR(handler))
>> -		return PTR_ERR(handler);
>> -	if (!handler->get)
>> -		return -EOPNOTSUPP;
>> -	return handler->get(handler, dentry, inode, name, value, size);
>> -}
>> -EXPORT_SYMBOL(__vfs_getxattr);
>> -
>> -ssize_t
>> -vfs_getxattr(struct dentry *dentry, const char *name, void *value, size_t size)
>> -{
>> -	struct inode *inode = dentry->d_inode;
>>   	int error;
>>   
>> +	if (flags & XATTR_NOSECURITY)
>> +		goto nolsm;
> Hum, is it OK for XATTR_NOSECURITY to skip even the xattr_permission()
> check? I understand that for reads of security xattrs it actually does not
> matter in practice but conceptually that seems wrong to me as
> XATTR_NOSECURITY is supposed to skip just security-module checks to avoid
> recursion AFAIU.

Good catch I think.

I was attempting to make this change purely inert, no change in 
functionality, only a change in API. Adding a call to xattr_permission 
would incur a change in overall functionality, as it would introduce 
into the current and original __vfs_getxattr a call to xattr_permission 
that was not there before.

(I will have to defer the real answer and requirements to the security 
folks)

AFAIK you are correct, and to make the call would reduce the attack 
surface, trading a very small amount of CPU utilization, for a much 
larger amount of trust.

Given the long history of this patch set (for overlayfs) and the large 
amount of stakeholders, I would _prefer_ to submit a followup 
independent functionality/security change to _vfs_get_xattr _after_ this 
makes it in.

>
>> diff --git a/include/uapi/linux/xattr.h b/include/uapi/linux/xattr.h
>> index c1395b5bd432..1216d777d210 100644
>> --- a/include/uapi/linux/xattr.h
>> +++ b/include/uapi/linux/xattr.h
>> @@ -17,8 +17,9 @@
>>   #if __UAPI_DEF_XATTR
>>   #define __USE_KERNEL_XATTR_DEFS
>>   
>> -#define XATTR_CREATE	0x1	/* set value, fail if attr already exists */
>> -#define XATTR_REPLACE	0x2	/* set value, fail if attr does not exist */
>> +#define XATTR_CREATE	 0x1	/* set value, fail if attr already exists */
>> +#define XATTR_REPLACE	 0x2	/* set value, fail if attr does not exist */
>> +#define XATTR_NOSECURITY 0x4	/* get value, do not involve security check */
>>   #endif
> It seems confusing to export XATTR_NOSECURITY definition to userspace when
> that is kernel-internal flag. I'd just define it in include/linux/xattr.h
> somewhere from the top of flags space (like 0x40000000).
>
> Otherwise the patch looks OK to me (cannot really comment on the security
> module aspect of this whole thing though).

Good point. However, we do need to keep these flags together to reduce 
maintenance risk, I personally abhor two locations for flags bits even 
if one comes from the opposite bit-side; collisions are undetectable at 
build time. Although I have not gone through the entire thought 
experiment, I am expecting that fuse could possibly benefit from this 
flag (if exposed) since it also has a security recursion. That said, 
fuse is probably the example of a gaping wide attack surface if user 
space had access to it ... your xattr_permissions call addition 
requested above would be realistically, not just pedantically, required!

I have to respin the patch because of yet another hole in filesystem 
coverage (I blew the mechanical ubifs adjustment, adjusted the wrong 
function), so please do tell if my rationalizations above hit a note, or 
if I _need_ to make the changes in this patch (change it to a series?).

Thanks -- Mark Salyzyn




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
