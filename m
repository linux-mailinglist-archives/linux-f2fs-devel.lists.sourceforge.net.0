Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F212AB2E27
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 May 2025 05:44:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jP8mloE7g2P1r738e8IbObadSa5JGeHncB+GU10LsvY=; b=i6M0FPkYyucTJi/V/wG7Jwspqm
	PbFS1513c0YD/082JMANCBO/1sehBF8HgpJHxG8oVlf6aFkTy/Mo9q3i9dC6lSq380O+hfUkvA335
	0tuWTTWHyzk3MlUDOhaonyc8ezKLg2B5eP8njaOm6cmEWE0xCAG5hr1YVDDJB4tE8YBc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEK52-0001NJ-Ru;
	Mon, 12 May 2025 03:43:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uEK50-0001ND-ON
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 03:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0eVlAKKwTyQipAq0O2/hE/5ALPaNgRy0pMRv2TNhvyo=; b=YXU4XflgLPGwSTqSeLIUQJ9VDj
 hEWLGz/9xIMMoR/Im+LpDRsU3gy7VrNLouG679NIOmrlmxWwOns26P4UM3n20UQ+LSH92VHmbO7Ac
 HDkl20J1OIY/H4/jE3ck7SXFgbDqaVjve82EW39JB0HCRNXF6S/O/5EhpgPCDeSIMD9E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0eVlAKKwTyQipAq0O2/hE/5ALPaNgRy0pMRv2TNhvyo=; b=Fp7Vbiy7FntJE+C5dpHVJqiyDr
 mWSaWmzgZu1tw5alxkkroHlM9SMd7doc13kb3qGKAP1ENJoh+FLS0Flaqs+6XS9pHywk+tNOvL9rk
 CeoE24ERmV6IfpzTw6QnBNPQkfx0ouZhTASbE1mT5isaZ5hF8DnS5ZHI/97mZQaeLZp8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEK4z-0007iL-TI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 03:43:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3D2D2A40C57;
 Mon, 12 May 2025 03:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D6CC4CEE7;
 Mon, 12 May 2025 03:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747021423;
 bh=uqcWxyA3RFJmeI8q7BXIHG5hR4mrjWFzeRmzlIcHb1o=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Hlay0nWxsAD+6aUu0owsoGuS4Yhn3oc7mAAgA/FJVNQmVdNSM9eyqyloG4vRjWbyu
 kktRd9FO36WG6k200+Sja5bS9EJRpxxa2iwLaHm+btkJUZF5rtgh3wTZMb5B76d0vi
 fB4aysq2lk2mknJ1/9LjqE5p1kOSq4b6B6KcpHzEU1OyAwNgTiHcXGioHZe/L6Rrt/
 GC37gvmDxylFRFhbnwlly90SMFIMsAamN6epwBdOR2LpRLbypqIvQWRtCcIJzh8M21
 57BcXUaAAipfZ+hRFlKFeVnfKEPzBWFsF+pNIrKToAxCJYx7VxYw3MF0OPm+CfRhkt
 AkyqCu2sx9hrQ==
Message-ID: <74704f7c-135e-4614-b805-404da6195930@kernel.org>
Date: Mon, 12 May 2025 11:43:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-8-sandeen@redhat.com>
 <b56964c2-ad30-4501-a7fd-1c0b41c407e9@kernel.org>
 <763bed71-1f44-4622-a9a0-d200f0418183@redhat.com>
Content-Language: en-US
In-Reply-To: <763bed71-1f44-4622-a9a0-d200f0418183@redhat.com>
X-Spam-Score: -4.1 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/8/25 23:59, Eric Sandeen wrote: > On 5/8/25 4:19 AM,
 Chao Yu wrote: >>> @@ -2645,21 +2603,11 @@ static int f2fs_remount(struct
 super_block *sb, int *flags, char *data) >>> >>> default_options(sbi [...]
 Content analysis details:   (-4.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEK4z-0007iL-TI
Subject: Re: [f2fs-dev] [PATCH V3 7/7] f2fs: switch to the new mount api
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/8/25 23:59, Eric Sandeen wrote:
> On 5/8/25 4:19 AM, Chao Yu wrote:
>>> @@ -2645,21 +2603,11 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>>>  
>>>  	default_options(sbi, true);
>>>  
>>> -	memset(&fc, 0, sizeof(fc));
>>> -	memset(&ctx, 0, sizeof(ctx));
>>> -	fc.fs_private = &ctx;
>>> -	fc.purpose = FS_CONTEXT_FOR_RECONFIGURE;
>>> -
>>> -	/* parse mount options */
>>> -	err = parse_options(&fc, data);
>>> -	if (err)
>>> -		goto restore_opts;
>> There is a retry flow during f2fs_fill_super(), I intenionally inject a
>> fault into f2fs_fill_super() to trigger the retry flow, it turns out that
>> mount option may be missed w/ below testcase:
> 
> I never did understand that retry logic (introduced in ed2e621a95d long
> ago). What errors does it expect to be able to retry, with success?

IIRC, it will retry mount if there is recovery failure due to inconsistent
metadata.

> 
> Anyway ...
> 
> Can you show me (as a patch) exactly what you did to trigger the retry,
> just so we are looking at the same thing?

You can try this?

---
 fs/f2fs/super.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0ee783224953..10f0e66059f8 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5066,6 +5066,12 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto reset_checkpoint;
 	}

+	if (retry_cnt) {
+		err = -EIO;
+		skip_recovery = true;
+		goto free_meta;
+	}
+
 	/* recover fsynced data */
 	if (!test_opt(sbi, DISABLE_ROLL_FORWARD) &&
 			!test_opt(sbi, NORECOVERY)) {
-- 
2.49.0

Thanks,

> 
>> - mkfs.f2fs -f -O encrypt /dev/vdb
>> - mount -o test_dummy_encryption /dev/vdb /mnt/f2fs/
>> : return success
>> - dmesg -c
>>
>> [   83.619982] f2fs_fill_super, retry_cnt:1
>> [   83.620914] F2FS-fs (vdb): Test dummy encryption mode enabled
>> [   83.668380] f2fs_fill_super, retry_cnt:0
>> [   83.671601] F2FS-fs (vdb): Mounted with checkpoint version = 7a8dfca5
>>
>> - mount|grep f2fs
>> /dev/vdb on /mnt/f2fs type f2fs (rw,relatime,lazytime,background_gc=on,nogc_merge,
>> discard,discard_unit=block,user_xattr,inline_xattr,acl,inline_data,inline_dentry,
>> flush_merge,barrier,extent_cache,mode=adaptive,active_logs=6,alloc_mode=reuse,
>> checkpoint_merge,fsync_mode=posix,memory=normal,errors=continue)
>>
>> The reason may be it has cleared F2FS_CTX_INFO(ctx).dummy_enc_policy in
>> f2fs_apply_test_dummy_encryption().
>>
>> static void f2fs_apply_test_dummy_encryption(struct fs_context *fc,
>> 					     struct super_block *sb)
>> {
>> 	struct f2fs_fs_context *ctx = fc->fs_private;
>> 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>>
>> 	if (!fscrypt_is_dummy_policy_set(&F2FS_CTX_INFO(ctx).dummy_enc_policy) ||
>> 		/* if already set, it was already verified to be the same */
>> 		fscrypt_is_dummy_policy_set(&F2FS_OPTION(sbi).dummy_enc_policy))
>> 		return;
>> 	F2FS_OPTION(sbi).dummy_enc_policy = F2FS_CTX_INFO(ctx).dummy_enc_policy;
>> 	memset(&F2FS_CTX_INFO(ctx).dummy_enc_policy, 0,
>> 		sizeof(F2FS_CTX_INFO(ctx).dummy_enc_policy));
>> 	f2fs_warn(sbi, "Test dummy encryption mode enabled");
>> }
>>
>> Can we save old mount_info from sbi or ctx from fc, and try to recover it
>> before we retry mount flow?
> 
> I'll have to take more time to understand this concern. But thanks for pointing
> it out.
> 
> -Eric
> 
>> Thanks,
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
