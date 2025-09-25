Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B761B9D58B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Sep 2025 05:59:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epVrMDhxTO/igrzfQZHpQIPU5O51fhvVwrnLShi8JdU=; b=NhBXK3DeeE7bDayXQkMapNGPjf
	bSamUq+uHpucaUb4bGR8bO38hWYBjX0hf/6fG/qWZh7DyI5CRxGIFrXyGoLcxfyJ/679S5p1GVJ4u
	i+7RN6cqmyq4RXHU0Q0hpxda9fh84skm/cP7y7IDwb/URCIoxtVh51q9uS6+Csk6NPOw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1d8Z-0008RH-9c;
	Thu, 25 Sep 2025 03:59:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3963UaAYKAPImYUhdWaiiafY.Wig@flex--seanjc.bounces.google.com>)
 id 1v1d8X-0008RA-NS for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 03:59:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WtyEMQPJo4fqytrWkgTZ3RdyfRt093nOgUIpQGdycFA=; b=CQ1pU3S4Xliuo+u5pBxAztSqh7
 6iPxGEqVCNvFUZiuwqHYXaNo770nTXu5U5vU4XbgXXWAHoybSaV2/r++u7MkDR0VlgrO77gqOYGCB
 MA3MiGPdXkLdpqCG5SyxW2jpNMCZjNb4YR/01+B5uDRhsTrGeK9NXVVH10YhcnRIuNP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WtyEMQPJo4fqytrWkgTZ3RdyfRt093nOgUIpQGdycFA=; b=B71CaeZcKWUS2ciFqhcbkqX4Kp
 iP5K9T4locJchYrHH3QfZJkCwGhcAA87aw4G+TYb62weipt32hXoOjLgQcUkXNPNiQ8wWU3NDQIMK
 m2JmfwGZCa75noRj6rfQuuzP4B4HwqJ9qjJO706x5WsneLAq6T+yHLt2ZPzZBsw03JaA=;
Received: from mail-vs1-f74.google.com ([209.85.217.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v1d8X-0007iL-0w for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 03:59:17 +0000
Received: by mail-vs1-f74.google.com with SMTP id
 ada2fe7eead31-5396b09cc58so773708137.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Sep 2025 20:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1758772746; x=1759377546;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=WtyEMQPJo4fqytrWkgTZ3RdyfRt093nOgUIpQGdycFA=;
 b=xVZWXF/p3RhWuy67Dp9KaM9EiEIdBbvIJOrMFeDOcUfDs/MF720QFk3p4SjDECPBe1
 EViB9SODwCpgpgaRUWq92AvJ8e0wQ+mbUE/L0kXVwhBfJaNHv2LOahH9pC1+yVkuJtMj
 g5S4pPmEnlD2eGsNBn9Kj3ufjP6dcBz5YOD37DsziRVx876Ale6NYr67ff+CUxAOiYZc
 BWsQeLElkjnkQ6gDW5B2VKh7Xj60kyHek16aXLg6wsOcJe5saWdwEY5FIwk2MB+FrM6+
 72Lha7fDABODXWEsy4QEWCEnKl22bnDo2qlw+EWVv07l721te8RK/KjPK5zFYg20ePoF
 UFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758772746; x=1759377546;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WtyEMQPJo4fqytrWkgTZ3RdyfRt093nOgUIpQGdycFA=;
 b=oFcebsq69pXp2rhSVBFWbwTUI9tGOBf6NOg63C5go20bmWKU2jhrJ/V3t6hHmsCj16
 t+1cnXPPhtCdbbhr8j1jVhrTpWjGLbCDry8L/5tQCcgCJNduqr80PVHajdfaEIEN8l+g
 cK2pk9q0uTwxsLzZMYhg/sSL8G2C2YlsKvjfuqHUdPPAjBr+li9+8q69QUF1mdAnTqqA
 dkLkOha1drfhQz+sMv+mYPUkT/Age7g/eu0TMeSUs3CoIEdSJhTSsi7FGbKeg9f86mHu
 0zLF0jGBbk9/uskzGz0nIWOeJYm/mC2yN7rKClOPTA+Co8FjsdN/WhfhkkH2i7wp/uVD
 Lmig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZMqSrlqBYY9EqKQHS5m8DwtRMd/SQVHphAPoY+hA62s7AtsXvIIedpEId3QR6iwd1nyIK+L8DkC2dg2LK3V4D@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzV/BFHm5nXlb5y2x943qNXSHpRMQDVEohMKy411+njPBGOdMoP
 XR3VtmQN2hcBdsf4Z1Nec9MPKlrDiE7tFOMXa67bnYNWm5bqnwZmBAJ2c3k4wIQy7GOEvN8USVP
 UBmY9dQ==
X-Google-Smtp-Source: AGHT+IFUzTzL+1uqRK/gqbR3SSwstvzUfWk/CsgKEnRDPuVsxH9OFn3e2zcGuFZY0INSLtUo/3MF8Uc68Iw=
X-Received: from pjbnn3.prod.google.com ([2002:a17:90b:38c3:b0:32d:e264:a78e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1b0b:b0:266:f01a:98d5
 with SMTP id d9443c01a7336-27ed4ab37a2mr23319415ad.57.1758768631155; Wed, 24
 Sep 2025 19:50:31 -0700 (PDT)
Date: Wed, 24 Sep 2025 19:50:29 -0700
In-Reply-To: <diqztt1sbd2v.fsf@google.com>
Mime-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-7-shivankg@amd.com>
 <diqztt1sbd2v.fsf@google.com>
Message-ID: <aNSt9QT8dmpDK1eE@google.com>
To: Ackerley Tng <ackerleytng@google.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  My apologies for the super late feedback. None of this is
 critical (mechanical things that can be cleaned up after the fact), so if
 there's any urgency to getting this series into 6.18, just ignore it [...]
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.74 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1v1d8X-0007iL-0w
Subject: Re: [f2fs-dev] [PATCH kvm-next V11 4/7] KVM: guest_memfd: Use guest
 mem inodes instead of anonymous inodes
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
From: Sean Christopherson via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: jgowans@amazon.com, mhocko@suse.com, jack@suse.cz, kvm@vger.kernel.org,
 david@redhat.com, linux-btrfs@vger.kernel.org, aik@amd.com, papaluri@amd.com,
 kalyazin@amazon.com, peterx@redhat.com, linux-mm@kvack.org, clm@fb.com,
 ddutile@redhat.com, linux-kselftest@vger.kernel.org, shdhiman@amd.com,
 gshan@redhat.com, ying.huang@linux.alibaba.com, shuah@kernel.org,
 roypat@amazon.co.uk, matthew.brost@intel.com, linux-coco@lists.linux.dev,
 zbestahu@gmail.com, lorenzo.stoakes@oracle.com, linux-bcachefs@vger.kernel.org,
 ira.weiny@intel.com, dhavale@google.com, jmorris@namei.org,
 willy@infradead.org, hch@infradead.org, chao.gao@intel.com, tabba@google.com,
 ziy@nvidia.com, rientjes@google.com, yuzhao@google.com, xiang@kernel.org,
 nikunj@amd.com, gourry@gourry.net, serge@hallyn.com,
 Shivank Garg <shivankg@amd.com>, thomas.lendacky@amd.com, ashish.kalra@amd.com,
 chao.p.peng@intel.com, yan.y.zhao@intel.com, byungchul@sk.com,
 michael.day@amd.com, Neeraj.Upadhyay@amd.com, michael.roth@amd.com,
 bfoster@redhat.com, josef@toxicpanda.com, Liam.Howlett@oracle.com,
 pvorel@suse.cz, dsterba@suse.com, viro@zeniv.linux.org.uk,
 jefflexu@linux.alibaba.com, jaegeuk@kernel.org, dan.j.williams@intel.com,
 surenb@google.com, vbabka@suse.cz, paul@paul-moore.com,
 joshua.hahnjy@gmail.com, apopple@nvidia.com, brauner@kernel.org,
 quic_eberman@quicinc.com, rakie.kim@sk.com, cgzones@googlemail.com,
 bharata@amd.com, linux-erofs@lists.ozlabs.org, kent.overstreet@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 pankaj.gupta@amd.com, linux-security-module@vger.kernel.org,
 lihongbo22@huawei.com, amit@infradead.org, linux-fsdevel@vger.kernel.org,
 pbonzini@redhat.com, akpm@linux-foundation.org, vannapurve@google.com,
 suzuki.poulose@arm.com, rppt@kernel.org, jgg@nvidia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

My apologies for the super late feedback.  None of this is critical (mechanical
things that can be cleaned up after the fact), so if there's any urgency to
getting this series into 6.18, just ignore it.

On Wed, Aug 27, 2025, Ackerley Tng wrote:
> Shivank Garg <shivankg@amd.com> writes:
> @@ -463,11 +502,70 @@ bool __weak kvm_arch_supports_gmem_mmap(struct kvm *kvm)
>  	return true;
>  }
> 
> +static struct inode *kvm_gmem_inode_create(const char *name, loff_t size,
> +					   u64 flags)
> +{
> +	struct inode *inode;
> +
> +	inode = anon_inode_make_secure_inode(kvm_gmem_mnt->mnt_sb, name, NULL);
> +	if (IS_ERR(inode))
> +		return inode;
> +
> +	inode->i_private = (void *)(unsigned long)flags;
> +	inode->i_op = &kvm_gmem_iops;
> +	inode->i_mapping->a_ops = &kvm_gmem_aops;
> +	inode->i_mode |= S_IFREG;
> +	inode->i_size = size;
> +	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
> +	mapping_set_inaccessible(inode->i_mapping);
> +	/* Unmovable mappings are supposed to be marked unevictable as well. */
> +	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
> +
> +	return inode;
> +}
> +
> +static struct file *kvm_gmem_inode_create_getfile(void *priv, loff_t size,
> +						  u64 flags)
> +{
> +	static const char *name = "[kvm-gmem]";
> +	struct inode *inode;
> +	struct file *file;
> +	int err;
> +
> +	err = -ENOENT;
> +	/* __fput() will take care of fops_put(). */
> +	if (!fops_get(&kvm_gmem_fops))
> +		goto err;
> +
> +	inode = kvm_gmem_inode_create(name, size, flags);
> +	if (IS_ERR(inode)) {
> +		err = PTR_ERR(inode);
> +		goto err_fops_put;
> +	}
> +
> +	file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR,
> +				 &kvm_gmem_fops);
> +	if (IS_ERR(file)) {
> +		err = PTR_ERR(file);
> +		goto err_put_inode;
> +	}
> +
> +	file->f_flags |= O_LARGEFILE;
> +	file->private_data = priv;
> +
> +	return file;
> +
> +err_put_inode:
> +	iput(inode);
> +err_fops_put:
> +	fops_put(&kvm_gmem_fops);
> +err:
> +	return ERR_PTR(err);
> +}

I don't see any reason to add two helpers.  It requires quite a bit more lines
of code due to adding more error paths and local variables, and IMO doesn't make
the code any easier to read.

Passing in "gmem" as @priv is especially ridiculous, as it adds code and
obfuscates what file->private_data is set to.

I get the sense that the code was written to be a "replacement" for common APIs,
but that is nonsensical (no pun intended).

>  static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
>  {
> -	const char *anon_name = "[kvm-gmem]";
>  	struct kvm_gmem *gmem;
> -	struct inode *inode;
>  	struct file *file;
>  	int fd, err;
> 
> @@ -481,32 +579,16 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
>  		goto err_fd;
>  	}
> 
> -	file = anon_inode_create_getfile(anon_name, &kvm_gmem_fops, gmem,
> -					 O_RDWR, NULL);
> +	file = kvm_gmem_inode_create_getfile(gmem, size, flags);
>  	if (IS_ERR(file)) {
>  		err = PTR_ERR(file);
>  		goto err_gmem;
>  	}
> 
> -	file->f_flags |= O_LARGEFILE;
> -
> -	inode = file->f_inode;
> -	WARN_ON(file->f_mapping != inode->i_mapping);
> -
> -	inode->i_private = (void *)(unsigned long)flags;
> -	inode->i_op = &kvm_gmem_iops;
> -	inode->i_mapping->a_ops = &kvm_gmem_aops;
> -	inode->i_mode |= S_IFREG;
> -	inode->i_size = size;
> -	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
> -	mapping_set_inaccessible(inode->i_mapping);
> -	/* Unmovable mappings are supposed to be marked unevictable as well. */
> -	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
> -
>  	kvm_get_kvm(kvm);
>  	gmem->kvm = kvm;
>  	xa_init(&gmem->bindings);
> -	list_add(&gmem->entry, &inode->i_mapping->i_private_list);
> +	list_add(&gmem->entry, &file_inode(file)->i_mapping->i_private_list);

I don't understand this change?  Isn't file_inode(file) == inode?

Compile tested only, and again not critical, but it's -40 LoC...


---
 include/uapi/linux/magic.h |  1 +
 virt/kvm/guest_memfd.c     | 75 ++++++++++++++++++++++++++++++++------
 virt/kvm/kvm_main.c        |  7 +++-
 virt/kvm/kvm_mm.h          |  9 +++--
 4 files changed, 76 insertions(+), 16 deletions(-)

diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
index bb575f3ab45e..638ca21b7a90 100644
--- a/include/uapi/linux/magic.h
+++ b/include/uapi/linux/magic.h
@@ -103,5 +103,6 @@
 #define DEVMEM_MAGIC		0x454d444d	/* "DMEM" */
 #define SECRETMEM_MAGIC		0x5345434d	/* "SECM" */
 #define PID_FS_MAGIC		0x50494446	/* "PIDF" */
+#define GUEST_MEMFD_MAGIC	0x474d454d	/* "GMEM" */
 
 #endif /* __LINUX_MAGIC_H__ */
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 08a6bc7d25b6..73c9791879d5 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -1,12 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/anon_inodes.h>
 #include <linux/backing-dev.h>
 #include <linux/falloc.h>
+#include <linux/fs.h>
 #include <linux/kvm_host.h>
+#include <linux/pseudo_fs.h>
 #include <linux/pagemap.h>
-#include <linux/anon_inodes.h>
 
 #include "kvm_mm.h"
 
+static struct vfsmount *kvm_gmem_mnt;
+
 struct kvm_gmem {
 	struct kvm *kvm;
 	struct xarray bindings;
@@ -385,9 +389,45 @@ static struct file_operations kvm_gmem_fops = {
 	.fallocate	= kvm_gmem_fallocate,
 };
 
-void kvm_gmem_init(struct module *module)
+static int kvm_gmem_init_fs_context(struct fs_context *fc)
+{
+	if (!init_pseudo(fc, GUEST_MEMFD_MAGIC))
+		return -ENOMEM;
+
+	fc->s_iflags |= SB_I_NOEXEC;
+	fc->s_iflags |= SB_I_NODEV;
+
+	return 0;
+}
+
+static struct file_system_type kvm_gmem_fs = {
+	.name		 = "guest_memfd",
+	.init_fs_context = kvm_gmem_init_fs_context,
+	.kill_sb	 = kill_anon_super,
+};
+
+static int kvm_gmem_init_mount(void)
+{
+	kvm_gmem_mnt = kern_mount(&kvm_gmem_fs);
+
+	if (IS_ERR(kvm_gmem_mnt))
+		return PTR_ERR(kvm_gmem_mnt);
+
+	kvm_gmem_mnt->mnt_flags |= MNT_NOEXEC;
+	return 0;
+}
+
+int kvm_gmem_init(struct module *module)
 {
 	kvm_gmem_fops.owner = module;
+
+	return kvm_gmem_init_mount();
+}
+
+void kvm_gmem_exit(void)
+{
+	kern_unmount(kvm_gmem_mnt);
+	kvm_gmem_mnt = NULL;
 }
 
 static int kvm_gmem_migrate_folio(struct address_space *mapping,
@@ -465,7 +505,7 @@ bool __weak kvm_arch_supports_gmem_mmap(struct kvm *kvm)
 
 static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 {
-	const char *anon_name = "[kvm-gmem]";
+	static const char *name = "[kvm-gmem]";
 	struct kvm_gmem *gmem;
 	struct inode *inode;
 	struct file *file;
@@ -481,17 +521,17 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 		goto err_fd;
 	}
 
-	file = anon_inode_create_getfile(anon_name, &kvm_gmem_fops, gmem,
-					 O_RDWR, NULL);
-	if (IS_ERR(file)) {
-		err = PTR_ERR(file);
+	/* __fput() will take care of fops_put(). */
+	if (!fops_get(&kvm_gmem_fops)) {
+		err = -ENOENT;
 		goto err_gmem;
 	}
 
-	file->f_flags |= O_LARGEFILE;
-
-	inode = file->f_inode;
-	WARN_ON(file->f_mapping != inode->i_mapping);
+	inode = anon_inode_make_secure_inode(kvm_gmem_mnt->mnt_sb, name, NULL);
+	if (IS_ERR(inode)) {
+		err = PTR_ERR(inode);
+		goto err_fops;
+	}
 
 	inode->i_private = (void *)(unsigned long)flags;
 	inode->i_op = &kvm_gmem_iops;
@@ -503,6 +543,15 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 	/* Unmovable mappings are supposed to be marked unevictable as well. */
 	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
 
+	file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR, &kvm_gmem_fops);
+	if (IS_ERR(file)) {
+		err = PTR_ERR(file);
+		goto err_inode;
+	}
+
+	file->f_flags |= O_LARGEFILE;
+	file->private_data = gmem;
+
 	kvm_get_kvm(kvm);
 	gmem->kvm = kvm;
 	xa_init(&gmem->bindings);
@@ -511,6 +560,10 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 	fd_install(fd, file);
 	return fd;
 
+err_inode:
+	iput(inode);
+err_fops:
+	fops_put(&kvm_gmem_fops);
 err_gmem:
 	kfree(gmem);
 err_fd:
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 18f29ef93543..301d48d6e00d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -6489,7 +6489,9 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 	if (WARN_ON_ONCE(r))
 		goto err_vfio;
 
-	kvm_gmem_init(module);
+	r = kvm_gmem_init(module);
+	if (r)
+		goto err_gmem;
 
 	r = kvm_init_virtualization();
 	if (r)
@@ -6510,6 +6512,8 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 err_register:
 	kvm_uninit_virtualization();
 err_virt:
+	kvm_gmem_exit();
+err_gmem:
 	kvm_vfio_ops_exit();
 err_vfio:
 	kvm_async_pf_deinit();
@@ -6541,6 +6545,7 @@ void kvm_exit(void)
 	for_each_possible_cpu(cpu)
 		free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
 	kmem_cache_destroy(kvm_vcpu_cache);
+	kvm_gmem_exit();
 	kvm_vfio_ops_exit();
 	kvm_async_pf_deinit();
 	kvm_irqfd_exit();
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index 31defb08ccba..9fcc5d5b7f8d 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -68,17 +68,18 @@ static inline void gfn_to_pfn_cache_invalidate_start(struct kvm *kvm,
 #endif /* HAVE_KVM_PFNCACHE */
 
 #ifdef CONFIG_KVM_GUEST_MEMFD
-void kvm_gmem_init(struct module *module);
+int kvm_gmem_init(struct module *module);
+void kvm_gmem_exit(void);
 int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args);
 int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 		  unsigned int fd, loff_t offset);
 void kvm_gmem_unbind(struct kvm_memory_slot *slot);
 #else
-static inline void kvm_gmem_init(struct module *module)
+static inline int kvm_gmem_init(struct module *module)
 {
-
+	return 0;
 }
-
+static inline void kvm_gmem_exit(void) {};
 static inline int kvm_gmem_bind(struct kvm *kvm,
 					 struct kvm_memory_slot *slot,
 					 unsigned int fd, loff_t offset)

base-commit: d133892dddd6607de651b7e32510359a6af97c4c
--


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
