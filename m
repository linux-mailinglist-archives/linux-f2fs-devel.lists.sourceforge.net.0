Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C63074B115
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jul 2023 14:43:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHknf-0003mP-6A;
	Fri, 07 Jul 2023 12:43:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qHknZ-0003lh-Qd;
 Fri, 07 Jul 2023 12:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KqYFX6K2BFU6XGUWySDxQkGT4Jq8Vp8jf4PAOwn7JSg=; b=G/as73EX3gxIk+iu+2SAacK+4e
 uVPUTdB5LhPJOsoq2T0NOXjbRgoCf2FefRzlkY2ix2jADaEuI+vudmzB5dCw2OenaRcuR3Rf7cIsM
 VBLpYYIeZeZAr4NOVdSu5S2+Kn4Mv4qazyCF6SzwMG+V+qWTP1Iimbb4T1cwC5+/Xnf4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KqYFX6K2BFU6XGUWySDxQkGT4Jq8Vp8jf4PAOwn7JSg=; b=YeW6LCf13hqb45hhcxv68AZS6w
 UVCoSeZrOfgljkfK5iQ4WiJJ/PpHFq4e9YRlzxHzzvZeIrIy7Xj+OPw5Ilvq+p7n2AdnzknxUB0zI
 PiDz+YYSalvECgJANKW4E7ppJNFD9G/SViURLYIiOxotVx8peHz+ty4+huD8RSkQ56lo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHknb-0005kM-IF; Fri, 07 Jul 2023 12:42:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 46E6860DC0;
 Fri,  7 Jul 2023 12:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F41C433C7;
 Fri,  7 Jul 2023 12:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688733770;
 bh=TyDDLyY/VcXA49d9KRhq25UQSsoE8KWu0+bfyRbBUqg=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=iyNIEkX0vplHsZRVLrECpVOA1mp+pn1xQk8anv4sNjl819MUB6L7g/QyZr09T8v7X
 4l5fvHniDmWHLBbdiHqiq9H2cTxWHaomnmD4P0h6lKZGmzU4smc5wAjNsqS84NFdll
 SSoDpJcqRJcJOvdAyIR3hUdTdGFP8DMxgpiVSBrtu8xsQGAVo33idlmhxRmj5xte2M
 GXiVu3pw23oyZWMMzp8kXFgZEQukowtqu+nAIcpDxVTKiHudvESqbwGfJcf0AdYGsm
 WEMofoo1motyhtMcUn2DtHPcG7Cqyp0rQarcusFg1CfwsyO+EeEA0qEhKts9ufRMsA
 P6UZP6VS0JBRg==
Message-ID: <5e40891f6423feb5b68f025e31f26e9a50ae9390.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Date: Fri, 07 Jul 2023 08:42:31 -0400
In-Reply-To: <20230705185812.579118-1-jlayton@kernel.org>
References: <20230705185812.579118-1-jlayton@kernel.org>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 2023-07-05 at 14:58 -0400, Jeff Layton wrote: > v2:
 > - prepend patches to add missing ctime updates > - add
 simple_rename_timestamp
 helper function > - rename ctime accessor functions as inod [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHknb-0005kM-IF
Subject: Re: [f2fs-dev] [PATCH v2 00/89] fs: new accessors for inode->i_ctime
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
Cc: lucho@ionkov.net, rafael@kernel.org, djwong@kernel.org, al@alarsen.net,
 cmllamas@google.com, andrii@kernel.org, hughd@google.com,
 john.johansen@canonical.com, agordeev@linux.ibm.com, hch@lst.de,
 hubcap@omnibond.com, pc@manguebit.com, linux-xfs@vger.kernel.org,
 bvanassche@acm.org, jeffxu@chromium.org, mpe@ellerman.id.au,
 john@keeping.me.uk, yi.zhang@huawei.com, jmorris@namei.org,
 christophe.leroy@csgroup.eu, code@tyhicks.com, stern@rowland.harvard.edu,
 borntraeger@linux.ibm.com, devel@lists.orangefs.org, mirimmad17@gmail.com,
 sprasad@microsoft.com, jaharkes@cs.cmu.edu, linux-um@lists.infradead.org,
 npiggin@gmail.com, viro@zeniv.linux.org.uk, ericvh@kernel.org,
 surenb@google.com, trond.myklebust@hammerspace.com, anton@tuxera.com,
 brauner@kernel.org, wsa+renesas@sang-engineering.com,
 gregkh@linuxfoundation.org, stephen.smalley.work@gmail.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, lsahlber@redhat.com,
 senozhatsky@chromium.org, arve@android.com, chuck.lever@oracle.com,
 svens@linux.ibm.com, jolsa@kernel.org, jack@suse.com, tj@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org,
 xu.xin16@zte.com.cn, shaggy@kernel.org, dhavale@google.com,
 penguin-kernel@I-love.SAKURA.ne.jp, zohar@linux.ibm.com, linux-mm@kvack.org,
 joel@joelfernandes.org, edumazet@google.com, sdf@google.com, jomajm@gmail.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org, paul@paul-moore.com,
 leon@kernel.org, john.fastabend@gmail.com, mcgrof@kernel.org,
 chi.minghao@zte.com.cn, codalist@coda.cs.cmu.edu, selinux@vger.kernel.org,
 zhangpeng362@huawei.com, quic_ugoswami@quicinc.com, yhs@fb.com,
 yzaikin@google.com, linkinjeon@kernel.org, mhiramat@kernel.org,
 ecryptfs@vger.kernel.org, tkjos@android.com, madkar@cs.stonybrook.edu,
 gor@linux.ibm.com, yuzhe@nfschina.com, linuxppc-dev@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, miklos@szeredi.hu, huyue2@coolpad.com,
 jaegeuk@kernel.org, gargaditya08@live.com, maco@android.com,
 hirofumi@mail.parknet.co.jp, haoluo@google.com, tony.luck@intel.com,
 tytso@mit.edu, nico@fluxnic.net, linux-ntfs-dev@lists.sourceforge.net,
 muchun.song@linux.dev, roberto.sassu@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net, yang.yang29@zte.com.cn,
 gpiccoli@igalia.com, ebiederm@xmission.com, anna@kernel.org,
 quic_uaggarwa@quicinc.com, bwarrum@linux.ibm.com, mike.kravetz@oracle.com,
 jingyuwang_vip@163.com, linux-efi@vger.kernel.org, error27@gmail.com,
 martin@omnibond.com, trix@redhat.com, ocfs2-devel@lists.linux.dev,
 ast@kernel.org, sebastian.reichel@collabora.com, clm@fb.com,
 linux-mtd@lists.infradead.org, willy@infradead.org, marc.dionne@auristor.com,
 linux-afs@lists.infradead.org, raven@themaw.net, naohiro.aota@wdc.com,
 daniel@iogearbox.net, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, quic_linyyuan@quicinc.com, coda@cs.cmu.edu,
 slava@dubeyko.com, idryomov@gmail.com, pabeni@redhat.com, adobriyan@gmail.com,
 serge@hallyn.com, axboe@kernel.dk, amir73il@gmail.com, linuszeng@tencent.com,
 keescook@chromium.org, arnd@arndb.de, autofs@vger.kernel.org,
 rostedt@goodmis.org, yifeliu@cs.stonybrook.edu, dlemoal@kernel.org,
 eparis@parisplace.org, ceph-devel@vger.kernel.org, xiang@kernel.org,
 yijiangshan@kylinos.cn, dhowells@redhat.com, linux-nfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, kolga@netapp.com, song@kernel.org,
 samba-technical@lists.samba.org, sfrench@samba.org, jk@ozlabs.org,
 netdev@vger.kernel.org, rpeterso@redhat.com, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org,
 davem@davemloft.net, jfs-discussion@lists.sourceforge.net,
 princekumarmaurya06@gmail.com, ebiggers@google.com, neilb@suse.de,
 asmadeus@codewreck.org, linux_oss@crudebyte.com, me@bobcopeland.com,
 kpsingh@kernel.org, okanatov@gmail.com,
 almaz.alexandrovich@paragon-software.com, joseph.qi@linux.alibaba.com,
 hayama@lineo.co.jp, adilger.kernel@dilger.ca, mikulas@artax.karlin.mff.cuni.cz,
 shaozhengchao@huawei.com, chenzhongjin@huawei.com, ardb@kernel.org,
 anton.ivanov@cambridgegreys.com, agruenba@redhat.com, richard@nod.at,
 mark@fasheh.com, shr@devkernel.io, Dai.Ngo@oracle.com,
 cluster-devel@redhat.com, jgg@ziepe.ca, kuba@kernel.org, riel@surriel.com,
 salah.triki@gmail.com, dushistov@mail.ru, linux-cifs@vger.kernel.org,
 hca@linux.ibm.com, apparmor@lists.ubuntu.com, josef@toxicpanda.com,
 Liam.Howlett@Oracle.com, tom@talpey.com, hdegoede@redhat.com,
 linux-hardening@vger.kernel.org, aivazian.tigran@gmail.com,
 dchinner@redhat.com, dsterba@suse.com, xiubli@redhat.com,
 konishi.ryusuke@gmail.com, jgross@suse.com, jth@kernel.org,
 rituagar@linux.ibm.com, luisbg@kernel.org, martin.lau@linux.dev,
 v9fs@lists.linux.dev, fmdefrancesco@gmail.com, linux-unionfs@vger.kernel.org,
 lrh2000@pku.edu.cn, linux-security-module@vger.kernel.org,
 ezk@cs.stonybrook.edu, jefflexu@linux.alibaba.com, linux@treblig.org,
 hannes@cmpxchg.org, phillip@squashfs.org.uk, johannes@sipsolutions.net,
 sj1557.seo@samsung.com, dwmw2@infradead.org,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 jlbec@evilplan.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 2023-07-05 at 14:58 -0400, Jeff Layton wrote:
> v2:
> - prepend patches to add missing ctime updates
> - add simple_rename_timestamp helper function
> - rename ctime accessor functions as inode_get_ctime/inode_set_ctime_*
> - drop individual inode_ctime_set_{sec,nsec} helpers
> 

After review by Jan and others, and Jan's ext4 rework, the diff on top
of the series I posted a couple of days ago is below. I don't really
want to spam everyone with another ~100 patch v3 series, but I can if
you think that's best.

Christian, what would you like me to do here?

diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
index bcdb1a0beccf..5f6e93714f5a 100644
--- a/fs/ceph/inode.c
+++ b/fs/ceph/inode.c
@@ -699,8 +699,7 @@ void ceph_fill_file_time(struct inode *inode, int issued,
 		if (ci->i_version == 0 ||
 		    timespec64_compare(ctime, &ictime) > 0) {
 			dout("ctime %lld.%09ld -> %lld.%09ld inc w/ cap\n",
-			     inode_get_ctime(inode).tv_sec,
-			     inode_get_ctime(inode).tv_nsec,
+			     ictime.tv_sec, ictime.tv_nsec,
 			     ctime->tv_sec, ctime->tv_nsec);
 			inode_set_ctime_to_ts(inode, *ctime);
 		}
diff --git a/fs/erofs/inode.c b/fs/erofs/inode.c
index 806374d866d1..567c0d305ea4 100644
--- a/fs/erofs/inode.c
+++ b/fs/erofs/inode.c
@@ -175,10 +175,7 @@ static void *erofs_read_inode(struct erofs_buf *buf,
 		vi->chunkbits = sb->s_blocksize_bits +
 			(vi->chunkformat & EROFS_CHUNK_FORMAT_BLKBITS_MASK);
 	}
-	inode->i_mtime.tv_sec = inode_get_ctime(inode).tv_sec;
-	inode->i_atime.tv_sec = inode_get_ctime(inode).tv_sec;
-	inode->i_mtime.tv_nsec = inode_get_ctime(inode).tv_nsec;
-	inode->i_atime.tv_nsec = inode_get_ctime(inode).tv_nsec;
+	inode->i_mtime = inode->i_atime = inode_get_ctime(inode);
 
 	inode->i_flags &= ~S_DAX;
 	if (test_opt(&sbi->opt, DAX_ALWAYS) && S_ISREG(inode->i_mode) &&
diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index c007de6ac1c7..1b9f587f6cca 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -1351,7 +1351,7 @@ static int exfat_rename(struct mnt_idmap *idmap,
 			exfat_warn(sb, "abnormal access to an inode dropped");
 			WARN_ON(new_inode->i_nlink == 0);
 		}
-		EXFAT_I(new_inode)->i_crtime = inode_set_ctime_current(new_inode);
+		EXFAT_I(new_inode)->i_crtime = current_time(new_inode);
 	}
 
 unlock:
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index d502b930431b..d63543187359 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -868,64 +868,63 @@ struct ext4_inode {
  * affected filesystem before 2242.
  */
 
-static inline __le32 ext4_encode_extra_time(struct timespec64 *time)
+static inline __le32 ext4_encode_extra_time(struct timespec64 ts)
 {
-	u32 extra =((time->tv_sec - (s32)time->tv_sec) >> 32) & EXT4_EPOCH_MASK;
-	return cpu_to_le32(extra | (time->tv_nsec << EXT4_EPOCH_BITS));
+	u32 extra = ((ts.tv_sec - (s32)ts.tv_sec) >> 32) & EXT4_EPOCH_MASK;
+	return cpu_to_le32(extra | (ts.tv_nsec << EXT4_EPOCH_BITS));
 }
 
-static inline void ext4_decode_extra_time(struct timespec64 *time,
-					  __le32 extra)
+static inline struct timespec64 ext4_decode_extra_time(__le32 base,
+						       __le32 extra)
 {
+	struct timespec64 ts = { .tv_sec = le32_to_cpu(base) };
+
 	if (unlikely(extra & cpu_to_le32(EXT4_EPOCH_MASK)))
-		time->tv_sec += (u64)(le32_to_cpu(extra) & EXT4_EPOCH_MASK) << 32;
-	time->tv_nsec = (le32_to_cpu(extra) & EXT4_NSEC_MASK) >> EXT4_EPOCH_BITS;
+		ts.tv_sec += (u64)(le32_to_cpu(extra) & EXT4_EPOCH_MASK) << 32;
+	ts.tv_nsec = (le32_to_cpu(extra) & EXT4_NSEC_MASK) >> EXT4_EPOCH_BITS;
+	return ts;
 }
 
-#define EXT4_INODE_SET_XTIME(xtime, inode, raw_inode)				\
+#define EXT4_INODE_SET_XTIME_VAL(xtime, inode, raw_inode, ts)			\
 do {										\
-	if (EXT4_FITS_IN_INODE(raw_inode, EXT4_I(inode), xtime ## _extra))     {\
-		(raw_inode)->xtime = cpu_to_le32((inode)->xtime.tv_sec);	\
-		(raw_inode)->xtime ## _extra =					\
-				ext4_encode_extra_time(&(inode)->xtime);	\
-		}								\
-	else	\
-		(raw_inode)->xtime = cpu_to_le32(clamp_t(int32_t, (inode)->xtime.tv_sec, S32_MIN, S32_MAX));	\
+	if (EXT4_FITS_IN_INODE(raw_inode, EXT4_I(inode), xtime ## _extra)) {	\
+		(raw_inode)->xtime = cpu_to_le32((ts).tv_sec);			\
+		(raw_inode)->xtime ## _extra = ext4_encode_extra_time(ts);	\
+	} else									\
+		(raw_inode)->xtime = cpu_to_le32(clamp_t(int32_t, (ts).tv_sec, S32_MIN, S32_MAX));	\
 } while (0)
 
+#define EXT4_INODE_SET_XTIME(xtime, inode, raw_inode)				\
+	EXT4_INODE_SET_XTIME_VAL(xtime, inode, raw_inode, (inode)->xtime)
+
+#define EXT4_INODE_SET_CTIME(inode, raw_inode)					\
+	EXT4_INODE_SET_XTIME_VAL(i_ctime, inode, raw_inode, inode_get_ctime(inode))
+
 #define EXT4_EINODE_SET_XTIME(xtime, einode, raw_inode)			       \
-do {									       \
-	if (EXT4_FITS_IN_INODE(raw_inode, einode, xtime))		       \
-		(raw_inode)->xtime = cpu_to_le32((einode)->xtime.tv_sec);      \
-	if (EXT4_FITS_IN_INODE(raw_inode, einode, xtime ## _extra))	       \
-		(raw_inode)->xtime ## _extra =				       \
-				ext4_encode_extra_time(&(einode)->xtime);      \
-} while (0)
+	EXT4_INODE_SET_XTIME_VAL(xtime, &((einode)->vfs_inode), raw_inode, (einode)->xtime)
+
+#define EXT4_INODE_GET_XTIME_VAL(xtime, inode, raw_inode)			\
+	(EXT4_FITS_IN_INODE(raw_inode, EXT4_I(inode), xtime ## _extra) ?	\
+		ext4_decode_extra_time((raw_inode)->xtime,				\
+				       (raw_inode)->xtime ## _extra) :		\
+		(struct timespec64) {						\
+			.tv_sec = (signed)le32_to_cpu((raw_inode)->xtime)	\
+		})
 
 #define EXT4_INODE_GET_XTIME(xtime, inode, raw_inode)				\
 do {										\
-	(inode)->xtime.tv_sec = (signed)le32_to_cpu((raw_inode)->xtime);	\
-	if (EXT4_FITS_IN_INODE(raw_inode, EXT4_I(inode), xtime ## _extra)) {	\
-		ext4_decode_extra_time(&(inode)->xtime,				\
-				       raw_inode->xtime ## _extra);		\
-		}								\
-	else									\
-		(inode)->xtime.tv_nsec = 0;					\
+	(inode)->xtime = EXT4_INODE_GET_XTIME_VAL(xtime, inode, raw_inode);	\
 } while (0)
 
+#define EXT4_INODE_GET_CTIME(inode, raw_inode)					\
+do {										\
+	inode_set_ctime_to_ts(inode,						\
+		EXT4_INODE_GET_XTIME_VAL(i_ctime, inode, raw_inode));		\
+} while (0)
 
 #define EXT4_EINODE_GET_XTIME(xtime, einode, raw_inode)			       \
 do {									       \
-	if (EXT4_FITS_IN_INODE(raw_inode, einode, xtime))		       \
-		(einode)->xtime.tv_sec = 				       \
-			(signed)le32_to_cpu((raw_inode)->xtime);	       \
-	else								       \
-		(einode)->xtime.tv_sec = 0;				       \
-	if (EXT4_FITS_IN_INODE(raw_inode, einode, xtime ## _extra))	       \
-		ext4_decode_extra_time(&(einode)->xtime,		       \
-				       raw_inode->xtime ## _extra);	       \
-	else								       \
-		(einode)->xtime.tv_nsec = 0;				       \
+	(einode)->xtime = EXT4_INODE_GET_XTIME_VAL(xtime, &(einode->vfs_inode), raw_inode);	\
 } while (0)
 
 #define i_disk_version osd1.linux1.l_i_version
@@ -3823,27 +3822,6 @@ static inline int ext4_buffer_uptodate(struct buffer_head *bh)
 	return buffer_uptodate(bh);
 }
 
-static inline void ext4_inode_set_ctime(struct inode *inode, struct ext4_inode *raw_inode)
-{
-	struct timespec64 ctime = inode_get_ctime(inode);
-
-	if (EXT4_FITS_IN_INODE(raw_inode, EXT4_I(inode), i_ctime_extra)) {
-		raw_inode->i_ctime = cpu_to_le32(ctime.tv_sec);
-		raw_inode->i_ctime_extra = ext4_encode_extra_time(&ctime);
-	} else {
-		raw_inode->i_ctime = cpu_to_le32(clamp_t(int32_t, ctime.tv_sec, S32_MIN, S32_MAX));
-	}
-}
-
-static inline void ext4_inode_get_ctime(struct inode *inode, const struct ext4_inode *raw_inode)
-{
-	struct timespec64 ctime = { .tv_sec = (signed)le32_to_cpu(raw_inode->i_ctime) };
-
-	if (EXT4_FITS_IN_INODE(raw_inode, EXT4_I(inode), i_ctime_extra))
-		ext4_decode_extra_time(&ctime, raw_inode->i_ctime_extra);
-	inode_set_ctime(inode, ctime.tv_sec, ctime.tv_nsec);
-}
-
 #endif	/* __KERNEL__ */
 
 #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
diff --git a/fs/ext4/inode-test.c b/fs/ext4/inode-test.c
index 7935ea6cf92c..f0c0fd507fbc 100644
--- a/fs/ext4/inode-test.c
+++ b/fs/ext4/inode-test.c
@@ -245,9 +245,9 @@ static void inode_test_xtimestamp_decoding(struct kunit *test)
 	struct timestamp_expectation *test_param =
 			(struct timestamp_expectation *)(test->param_value);
 
-	timestamp.tv_sec = get_32bit_time(test_param);
-	ext4_decode_extra_time(&timestamp,
-			       cpu_to_le32(test_param->extra_bits));
+	timestamp = ext4_decode_extra_time(
+				cpu_to_le32(get_32bit_time(test_param)),
+				cpu_to_le32(test_param->extra_bits));
 
 	KUNIT_EXPECT_EQ_MSG(test,
 			    test_param->expected.tv_sec,
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index bbc57954dfd3..c6a837b90af4 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -4249,7 +4249,7 @@ static int ext4_fill_raw_inode(struct inode *inode, struct ext4_inode *raw_inode
 	}
 	raw_inode->i_links_count = cpu_to_le16(inode->i_nlink);
 
-	ext4_inode_set_ctime(inode, raw_inode);
+	EXT4_INODE_SET_CTIME(inode, raw_inode);
 	EXT4_INODE_SET_XTIME(i_mtime, inode, raw_inode);
 	EXT4_INODE_SET_XTIME(i_atime, inode, raw_inode);
 	EXT4_EINODE_SET_XTIME(i_crtime, ei, raw_inode);
@@ -4858,7 +4858,7 @@ struct inode *__ext4_iget(struct super_block *sb, unsigned long ino,
 		}
 	}
 
-	ext4_inode_get_ctime(inode, raw_inode);
+	EXT4_INODE_GET_CTIME(inode, raw_inode);
 	EXT4_INODE_GET_XTIME(i_mtime, inode, raw_inode);
 	EXT4_INODE_GET_XTIME(i_atime, inode, raw_inode);
 	EXT4_EINODE_GET_XTIME(i_crtime, ei, raw_inode);
@@ -4981,7 +4981,7 @@ static void __ext4_update_other_inode_time(struct super_block *sb,
 		spin_unlock(&inode->i_lock);
 
 		spin_lock(&ei->i_raw_lock);
-		ext4_inode_get_ctime(inode, raw_inode);
+		EXT4_INODE_SET_CTIME(inode, raw_inode);
 		EXT4_INODE_SET_XTIME(i_mtime, inode, raw_inode);
 		EXT4_INODE_SET_XTIME(i_atime, inode, raw_inode);
 		ext4_inode_csum_set(inode, raw_inode, ei);
diff --git a/fs/fat/inode.c b/fs/fat/inode.c
index 2be40ff8a74f..cdd39b6020f3 100644
--- a/fs/fat/inode.c
+++ b/fs/fat/inode.c
@@ -1407,9 +1407,7 @@ static int fat_read_root(struct inode *inode)
 	MSDOS_I(inode)->mmu_private = inode->i_size;
 
 	fat_save_attrs(inode, ATTR_DIR);
-	inode->i_mtime.tv_sec = inode->i_atime.tv_sec = inode_set_ctime(inode,
-									0, 0).tv_sec;
-	inode->i_mtime.tv_nsec = inode->i_atime.tv_nsec = 0;
+	inode->i_mtime = inode->i_atime = inode_set_ctime(inode, 0, 0);
 	set_nlink(inode, fat_subdirs(inode)+2);
 
 	return 0;
diff --git a/fs/hpfs/namei.c b/fs/hpfs/namei.c
index 36babb78b510..f4eb8d6f5989 100644
--- a/fs/hpfs/namei.c
+++ b/fs/hpfs/namei.c
@@ -15,8 +15,7 @@ static void hpfs_update_directory_times(struct inode *dir)
 	if (t == dir->i_mtime.tv_sec &&
 	    t == inode_get_ctime(dir).tv_sec)
 		return;
-	dir->i_mtime.tv_sec = inode_set_ctime(dir, t, 0).tv_sec;
-	dir->i_mtime.tv_nsec = 0;
+	dir->i_mtime = inode_set_ctime(dir, t, 0);
 	hpfs_write_inode_nolock(dir);
 }
 
@@ -59,11 +58,8 @@ static int hpfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	result->i_ino = fno;
 	hpfs_i(result)->i_parent_dir = dir->i_ino;
 	hpfs_i(result)->i_dno = dno;
-	inode_set_ctime(result,
-			result->i_mtime.tv_sec = result->i_atime.tv_sec = local_to_gmt(dir->i_sb, le32_to_cpu(dee.creation_date)),
-			0);
-	result->i_mtime.tv_nsec = 0; 
-	result->i_atime.tv_nsec = 0; 
+	result->i_mtime = result->i_atime =
+		inode_set_ctime(result, local_to_gmt(dir->i_sb, le32_to_cpu(dee.creation_date)), 0);
 	hpfs_i(result)->i_ea_size = 0;
 	result->i_mode |= S_IFDIR;
 	result->i_op = &hpfs_dir_iops;
@@ -168,11 +164,8 @@ static int hpfs_create(struct mnt_idmap *idmap, struct inode *dir,
 	result->i_fop = &hpfs_file_ops;
 	set_nlink(result, 1);
 	hpfs_i(result)->i_parent_dir = dir->i_ino;
-	inode_set_ctime(result,
-			result->i_mtime.tv_sec = result->i_atime.tv_sec = local_to_gmt(dir->i_sb, le32_to_cpu(dee.creation_date)),
-			0);
-	result->i_mtime.tv_nsec = 0;
-	result->i_atime.tv_nsec = 0;
+	result->i_mtime = result->i_atime =
+		inode_set_ctime(result, local_to_gmt(dir->i_sb, le32_to_cpu(dee.creation_date)), 0);
 	hpfs_i(result)->i_ea_size = 0;
 	if (dee.read_only)
 		result->i_mode &= ~0222;
@@ -252,11 +245,8 @@ static int hpfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 	hpfs_init_inode(result);
 	result->i_ino = fno;
 	hpfs_i(result)->i_parent_dir = dir->i_ino;
-	inode_set_ctime(result,
-			result->i_mtime.tv_sec = result->i_atime.tv_sec = local_to_gmt(dir->i_sb, le32_to_cpu(dee.creation_date)),
-			0);
-	result->i_mtime.tv_nsec = 0;
-	result->i_atime.tv_nsec = 0;
+	result->i_mtime = result->i_atime =
+		inode_set_ctime(result, local_to_gmt(dir->i_sb, le32_to_cpu(dee.creation_date)), 0);
 	hpfs_i(result)->i_ea_size = 0;
 	result->i_uid = current_fsuid();
 	result->i_gid = current_fsgid();
@@ -329,11 +319,8 @@ static int hpfs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 	result->i_ino = fno;
 	hpfs_init_inode(result);
 	hpfs_i(result)->i_parent_dir = dir->i_ino;
-	inode_set_ctime(result,
-			result->i_mtime.tv_sec = result->i_atime.tv_sec = local_to_gmt(dir->i_sb, le32_to_cpu(dee.creation_date)),
-			0);
-	result->i_mtime.tv_nsec = 0;
-	result->i_atime.tv_nsec = 0;
+	result->i_mtime = result->i_atime =
+		inode_set_ctime(result, local_to_gmt(dir->i_sb, le32_to_cpu(dee.creation_date)), 0);
 	hpfs_i(result)->i_ea_size = 0;
 	result->i_mode = S_IFLNK | 0777;
 	result->i_uid = current_fsuid();
diff --git a/fs/isofs/inode.c b/fs/isofs/inode.c
index 98a78200cff1..2ee21286ac8f 100644
--- a/fs/isofs/inode.c
+++ b/fs/isofs/inode.c
@@ -1422,13 +1422,8 @@ static int isofs_read_inode(struct inode *inode, int relocated)
 			inode->i_ino, de->flags[-high_sierra]);
 	}
 #endif
-
-	inode->i_mtime.tv_sec =
-	inode->i_atime.tv_sec = inode_set_ctime(inode,
-						iso_date(de->date, high_sierra),
-						0).tv_sec;
-	inode->i_mtime.tv_nsec =
-	inode->i_atime.tv_nsec = 0;
+	inode->i_mtime = inode->i_atime =
+		inode_set_ctime(inode, iso_date(de->date, high_sierra), 0);
 
 	ei->i_first_extent = (isonum_733(de->extent) +
 			isonum_711(de->ext_attr_length));
diff --git a/fs/minix/inode.c b/fs/minix/inode.c
index 3715a3940bd4..8a4fc9420b36 100644
--- a/fs/minix/inode.c
+++ b/fs/minix/inode.c
@@ -501,11 +501,7 @@ static struct inode *V1_minix_iget(struct inode *inode)
 	i_gid_write(inode, raw_inode->i_gid);
 	set_nlink(inode, raw_inode->i_nlinks);
 	inode->i_size = raw_inode->i_size;
-	inode->i_mtime.tv_sec = inode->i_atime.tv_sec = inode_set_ctime(inode,
-									raw_inode->i_time,
-									0).tv_sec;
-	inode->i_mtime.tv_nsec = 0;
-	inode->i_atime.tv_nsec = 0;
+	inode->i_mtime = inode->i_atime = inode_set_ctime(inode, raw_inode->i_time, 0);
 	inode->i_blocks = 0;
 	for (i = 0; i < 9; i++)
 		minix_inode->u.i1_data[i] = raw_inode->i_zone[i];
diff --git a/fs/overlayfs/file.c b/fs/overlayfs/file.c
index 7acd3e3fe790..7e7876aae01c 100644
--- a/fs/overlayfs/file.c
+++ b/fs/overlayfs/file.c
@@ -255,7 +255,7 @@ static void ovl_file_accessed(struct file *file)
 	if ((!timespec64_equal(&inode->i_mtime, &upperinode->i_mtime) ||
 	     !timespec64_equal(&ctime, &uctime))) {
 		inode->i_mtime = upperinode->i_mtime;
-		inode_set_ctime_to_ts(inode, inode_get_ctime(upperinode));
+		inode_set_ctime_to_ts(inode, uctime);
 	}
 
 	touch_atime(&file->f_path);
diff --git a/fs/romfs/super.c b/fs/romfs/super.c
index 961b9d342e0e..d89739655f9e 100644
--- a/fs/romfs/super.c
+++ b/fs/romfs/super.c
@@ -322,8 +322,7 @@ static struct inode *romfs_iget(struct super_block *sb, unsigned long pos)
 
 	set_nlink(i, 1);		/* Hard to decide.. */
 	i->i_size = be32_to_cpu(ri.size);
-	i->i_mtime.tv_sec = i->i_atime.tv_sec = inode_set_ctime(i, 0, 0).tv_sec;
-	i->i_mtime.tv_nsec = i->i_atime.tv_nsec = 0;
+	i->i_mtime = i->i_atime = inode_set_ctime(i, 0, 0);
 
 	/* set up mode and ops */
 	mode = romfs_modemap[nextfh & ROMFH_TYPE];
diff --git a/fs/smb/client/fscache.h b/fs/smb/client/fscache.h
index a228964bc2ce..84f3b09367d2 100644
--- a/fs/smb/client/fscache.h
+++ b/fs/smb/client/fscache.h
@@ -56,7 +56,7 @@ void cifs_fscache_fill_coherency(struct inode *inode,
 	cd->last_write_time_sec   = cpu_to_le64(cifsi->netfs.inode.i_mtime.tv_sec);
 	cd->last_write_time_nsec  = cpu_to_le32(cifsi->netfs.inode.i_mtime.tv_nsec);
 	cd->last_change_time_sec  = cpu_to_le64(ctime.tv_sec);
-	cd->last_change_time_nsec  = cpu_to_le64(ctime.tv_nsec);
+	cd->last_change_time_nsec = cpu_to_le32(ctime.tv_nsec);
 }
 
 

-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
