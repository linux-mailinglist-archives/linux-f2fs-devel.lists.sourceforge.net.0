Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F038BBA6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2019 16:37:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:Message-ID:
	References:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhbKvZwXWCrNSyjCO6KR9Q48fzIoCWwkFGUvX0x1Cok=; b=ZIgKIljWJ8nsaQ8TiYSaaL/C/A
	LAC4ZvBG2dWTw7aPGV7tZ7/MernvRxNrf9lbmbhKXucc8FiJ39+SHPP3OkrxYQ0yu+b8LjDWftHxH
	oUHj3ps9W3zHbQzYr+OVeIblGgariB2djXHNOoUWbaMtwCE0wxx1AF6MERWQ2iruf1Ts=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxXvk-0007QO-Sc; Tue, 13 Aug 2019 14:37:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <salyzyn@android.com>) id 1hxXvj-0007QC-6u
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Aug 2019 14:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bw4HKPsz5KHcjk6HSfejuCsIw3GJFzkr29hAUy0bps0=; b=EbhqwXjr8uzOqJyhjx6ouLEqP7
 AlrQ7kOwIOVb9tFFcqIO4tT0svYHwTjCCUM/OWpXrWsAUt0huozg/t2B8Wu1C2XM2cGx6QdvYvjvD
 o3F2Xl/IEfd7trTyXC1tvPE+EX6qcWnkpaCLbr+tiTCUntJRyIw5OixsH4vIFP1siltU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bw4HKPsz5KHcjk6HSfejuCsIw3GJFzkr29hAUy0bps0=; b=MmqUvEAt2lM1v8lzotpU3cKvUK
 jGm1saGTbrvbBmvZJr1huKiuYEYPINQlSsXJFNC/ZmbjkrNXJesB7IAFu3i5KiptqK5YpsVDsV5mn
 JRK3RQt2JoMf5YlQ3DCQ8G1TAdJ8aDVhqIK5cSjkQNFE7Ls9MPlFhHg4qv5XoZfCa6S0=;
Received: from mail-pl1-f195.google.com ([209.85.214.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hxXvf-004lCS-GO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Aug 2019 14:37:43 +0000
Received: by mail-pl1-f195.google.com with SMTP id m9so49195749pls.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Aug 2019 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=bw4HKPsz5KHcjk6HSfejuCsIw3GJFzkr29hAUy0bps0=;
 b=MFtq1gVoaeUSMonwadLhXhTtdodprj0ov0yRnwcJzaEizH9iXc2AyEe2YsLLjL9Em/
 DnRWUrLHNQkMs6a4pyzNtrfV9fh+f0WakaT7EGR/SddCESx4gNUJvdWbI0AnPn8pRpA3
 wgmNSZiOuSrw44CJp44y0pGPN0U6VzVYkB7JCci+tCmHHs3IKTEqfV+veY5UEDP6fcp7
 FcnOe1UR/JGhNA1vKqUgRY0O8lDkppt5VkhCp5z7ne3Sr1+pfITYHkHNFOIDKkVzXAz3
 95wisabfmhqSW6q/xPUyroW+UZ9ddmhvgoPCBG7x434/HPUw3rZO1bStEKXJRGENRSDr
 pjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bw4HKPsz5KHcjk6HSfejuCsIw3GJFzkr29hAUy0bps0=;
 b=Id1a9CdbxTi7LgDUQ1XuDLxR5VGZwMjeJvhd38W7VKkfjusdeCUkGfBeCILc+V02Mj
 OwQdc4IgpEoZWzXb7zbQwxjZO1zvDPyUNA3cIJQ/KJLiG3+fvEAfg5fkbgM5eBldJ2oM
 4HMGerNkZcvlOGfjdg9Ndm/xkYC26tJ/nM3qHnXEkqlGUyjgS+qbVI/K/oDjhoy77PAD
 ufBmtV7ouLFiE4E1IsxkCacUQwr7djVy7LLpNOCp43JBUkO7Jvt9WJ4YvSwFo6as1SnJ
 jdhK/dwbOOB2Pj1S8JRoo3gopvjjTf90/8hrDTrH8SXOye3tgAuvn7Pltzfxl5wjKTX5
 xzGw==
X-Gm-Message-State: APjAAAW2HAfcdBjMy1ebB9pVEBtU0tb5IjP6S0vPjxdWAXizr8ZCK6+R
 j2HwObxwjhxeNvzfsJgFA6cwhQ==
X-Google-Smtp-Source: APXvYqyXJXgYI0HIs6xWxNQDIPLGgCxznsuGq+ryK3xceeQe7Za7UsLXSNSEqPCOTlNm5RgIykOuPA==
X-Received: by 2002:a17:902:aa03:: with SMTP id
 be3mr38125628plb.240.1565707053626; 
 Tue, 13 Aug 2019 07:37:33 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
 ([2620:15c:211:200:5404:91ba:59dc:9400])
 by smtp.googlemail.com with ESMTPSA id
 v63sm114972475pfv.174.2019.08.13.07.37.30
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 07:37:32 -0700 (PDT)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20190812193320.200472-1-salyzyn@android.com>
 <20190813084801.GA972@kroah.com>
Message-ID: <e211bef2-f346-c9c7-f4b8-c774159b14e1@android.com>
Date: Tue, 13 Aug 2019 07:37:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813084801.GA972@kroah.com>
Content-Language: en-GB
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hxXvf-004lCS-GO
Subject: Re: [f2fs-dev] [PATCH] Add flags option to get xattr method paired
 to __vfs_getxattr
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
 jfs-discussion@lists.sourceforge.net, linux-integrity@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org,
 Dominique Martinet <asmadeus@codewreck.org>, Mimi Zohar <zohar@linux.ibm.com>,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, "David S. Miller" <davem@davemloft.net>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Eric Paris <eparis@parisplace.org>,
 netdev@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, James Morris <jmorris@namei.org>,
 cluster-devel@redhat.com, selinux@vger.kernel.org,
 Vyacheslav Dubeyko <slava@dubeyko.com>,
 Casey Schaufler <casey@schaufler-ca.com>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 kernel-team@android.com, linux-mm@kvack.org, devel@lists.orangefs.org,
 Serge Hallyn <serge@hallyn.com>,
 =?UTF-8?Q?Ernesto_A=2e_Fern=c3=a1ndez?= <ernesto.mnd.fernandez@gmail.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@gmail.com>,
 ecryptfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Joel Becker <jlbec@evilplan.org>, linux-mtd@lists.infradead.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Paul Moore <paul@paul-moore.com>, linux-nfs@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Mathieu Malaterre <malat@debian.org>,
 Stephen Smalley <sds@tycho.nsa.gov>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Tyler Hicks <tyhicks@canonical.com>, Steve French <sfrench@samba.org>,
 linux-security-module@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 Jan Kara <jack@suse.com>, Bob Peterson <rpeterso@redhat.com>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/13/19 1:48 AM, Greg Kroah-Hartman wrote:
> On Mon, Aug 12, 2019 at 12:32:49PM -0700, Mark Salyzyn wrote:
>> --- a/include/linux/xattr.h
>> +++ b/include/linux/xattr.h
>> @@ -30,10 +30,10 @@ struct xattr_handler {
>>   	const char *prefix;
>>   	int flags;      /* fs private flags */
>>   	bool (*list)(struct dentry *dentry);
>> -	int (*get)(const struct xattr_handler *, struct dentry *dentry,
>> +	int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
>>   		   struct inode *inode, const char *name, void *buffer,
>> -		   size_t size);
>> -	int (*set)(const struct xattr_handler *, struct dentry *dentry,
>> +		   size_t size, int flags);
>> +	int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
>>   		   struct inode *inode, const char *name, const void *buffer,
>>   		   size_t size, int flags);
> Wow, 7 arguments.  Isn't there some nice rule of thumb that says once
> you get more then 5, a function becomes impossible to understand?

This is a method with a pot-pourri of somewhat intuitive useful, but not 
always necessary, arguments, the additional argument does not complicate 
the function(s) AFAIK, but maybe its usage. Most functions do not even 
reference handler, the inode is typically a derivative of dentry, The 
arguments most used are the name of the attribute and the buffer/size 
the results are to be placed into.

The addition of flags is actually a pattern borrowed from the [.]set 
method, which provides at least 32 bits of 'control' (of which we added 
only one). Before, it was an anti-pattern.

> Surely this could be a structure passed in here somehow, that way when
> you add the 8th argument in the future, you don't have to change
> everything yet again?  :)
Just be happy I provided int flags, instead of bool no_security ;-> 
there are a few bits there that can be used in the future.
> I don't have anything concrete to offer as a replacement fix for this,
> but to me this just feels really wrong...

I went through 6 different alternatives (in the overlayfs security fix 
patch set) until I found this one that resonated with the security and 
filesystem stakeholders. The one was a direct result of trying to reduce 
the security attack surface. This code was created by threading a 
needle, and evolution. I am game for a 7th alternative to solve the 
unionfs set of recursive calls into acquiring the extended attributes.

-- Mark


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
