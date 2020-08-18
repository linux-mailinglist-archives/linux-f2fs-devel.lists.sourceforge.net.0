Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B8247EB6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Aug 2020 08:52:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k7vTj-00021x-7y; Tue, 18 Aug 2020 06:52:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1k7vTi-00021q-61
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Aug 2020 06:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TyX0R+jCBT0p7qXc0hNlEWd5mRPKCTJmMMNKIUzxfws=; b=EQ58hTbXBqFVY5zV1poJbJFx32
 GsGJwgpLPGoaIe1rmtWjJB1OR9JYvPQo3+ngwVIKbTHE0njU1fWPn34wkANp25wy1LJ3Ti1tYATiw
 2r0kr01i6+iYk3tqI86AzHxtQRXbystiaMXomyj/VZKqXWcjxCnjkEcnaD7PRMQZwI/E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TyX0R+jCBT0p7qXc0hNlEWd5mRPKCTJmMMNKIUzxfws=; b=K/LTLTAdL7zrnGT/mah+FxEBtN
 4ctsZlUA08JC3KE2BOIsOBppW3ni4KMtK8Mq+/O7hJLPCHiOQbZnnZ+uTfLplwqq3krmJQZtWJST9
 BtT0diYrh20WyTxhyCWBeY9U3EMzX+nj3ogDJu438xlc61p6u1D1YV473A7dHCR7FFLQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k7vTg-00B6r3-H4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Aug 2020 06:52:14 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12E9B20639;
 Tue, 18 Aug 2020 06:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597733527;
 bh=CRFsQ3dgy1B0wMTMGfuS6U6ch/n0JaeUsKYEnlxbgQE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0TfFfT3BjsGEesQIhBJ1JuMLRpn9ca7QFo2UYu98hgBU4WUOTr2YQzvueT92CqjNe
 h0Q+DLmvii0WLVvj3dBQdHJATuY0qjLPQ39jdF9k7L4fVHTV/F/Kfg8s+LKwfbI3K/
 2YVXSpwueC5wpOzpoXpnSSBSMr2z7o7kjltjOc+Y=
Date: Mon, 17 Aug 2020 23:52:06 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200818065206.GA3751716@google.com>
References: <20200805080913.48133-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200805080913.48133-1-yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: die.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1k7vTg-00B6r3-H4
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: correct return value
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
Cc: nolange79@gmail.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/05, Chao Yu wrote:
> As Norbert Lange reported:
> =

> "
> $ fsck.f2fs -a /dev/mmcblk0p5; echo $?
> Info: Fix the reported corruption.
> Info: Mounted device!
> Info: Check FS only on RO mounted device
> Error: Failed to open the device!
> 255
> "
> =

> Michael La=DF reminds:
> =

> "
> I think the return value is exactly the problem here. See fsck(8) (
> https://linux.die.net/man/8/fsck) which specifies the return values.
> Systemd looks at these and decides how to proceed:
> =

> https://github.com/systemd/systemd/blob/a859abf062cef1511e4879c4ee39c6036=
ebeaec8/src/fsck/fsck.c#L407
> =

> That means, if fsck.f2fs returns 255, then
> the FSCK_SYSTEM_SHOULD_REBOOT bit is set and systemd will reboot.
> "
> =

> So the problem here is fsck.f2fs didn't return correct value to userspace
> apps, result in later unexpected behavior of rebooting, let's fix this.
> =

> Reported-by: Norbert Lange <nolange79@gmail.com>
> Reported-by: Michael La=DF <bevan@bi-co.net>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fsck/fsck.h | 11 +++++++++++
>  fsck/main.c | 27 +++++++++++++++++++++------
>  2 files changed, 32 insertions(+), 6 deletions(-)
> =

> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index e86730c34fc4..c5e85fefa07b 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -13,6 +13,17 @@
>  =

>  #include "f2fs.h"
>  =

> +enum {
> +	FSCK_SUCCESS                 =3D 0,
> +	FSCK_ERROR_CORRECTED         =3D 1 << 0,
> +	FSCK_SYSTEM_SHOULD_REBOOT    =3D 1 << 1,
> +	FSCK_ERRORS_LEFT_UNCORRECTED =3D 1 << 2,
> +	FSCK_OPERATIONAL_ERROR       =3D 1 << 3,
> +	FSCK_USAGE_OR_SYNTAX_ERROR   =3D 1 << 4,
> +	FSCK_USER_CANCELLED          =3D 1 << 5,
> +	FSCK_SHARED_LIB_ERROR        =3D 1 << 7,
> +};
> +
>  struct quota_ctx;
>  =

>  #define FSCK_UNMATCHED_EXTENT		0x00000001
> diff --git a/fsck/main.c b/fsck/main.c
> index 9a1596f35e79..11d472b9941c 100644
> --- a/fsck/main.c
> +++ b/fsck/main.c
> @@ -630,7 +630,7 @@ void f2fs_parse_options(int argc, char *argv[])
>  	error_out(prog);
>  }
>  =

> -static void do_fsck(struct f2fs_sb_info *sbi)
> +static int do_fsck(struct f2fs_sb_info *sbi)
>  {
>  	struct f2fs_checkpoint *ckpt =3D F2FS_CKPT(sbi);
>  	u32 flag =3D le32_to_cpu(ckpt->ckpt_flags);
> @@ -655,7 +655,7 @@ static void do_fsck(struct f2fs_sb_info *sbi)
>  			} else {
>  				MSG(0, "[FSCK] F2FS metadata   [Ok..]");
>  				fsck_free(sbi);
> -				return;
> +				return FSCK_SUCCESS;
>  			}
>  =

>  			if (!c.ro)
> @@ -687,7 +687,7 @@ static void do_fsck(struct f2fs_sb_info *sbi)
>  		ret =3D quota_init_context(sbi);
>  		if (ret) {
>  			ASSERT_MSG("quota_init_context failure: %d", ret);
> -			return;
> +			return FSCK_OPERATIONAL_ERROR;
>  		}
>  	}
>  	fsck_chk_orphan_node(sbi);
> @@ -695,8 +695,14 @@ static void do_fsck(struct f2fs_sb_info *sbi)
>  			F2FS_FT_DIR, TYPE_INODE, &blk_cnt, NULL);
>  	fsck_chk_quota_files(sbi);
>  =

> -	fsck_verify(sbi);
> +	ret =3D fsck_verify(sbi);
>  	fsck_free(sbi);
> +
> +	if (!c.bug_on)
> +		return FSCK_SUCCESS;
> +	if (!ret)
> +		return FSCK_ERROR_CORRECTED;

I applied this to get FSCK_ERROR_CORRECTED.

--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3165,6 +3165,8 @@ int fsck_verify(struct f2fs_sb_info *sbi)
                        is_set_ckpt_flags(cp, CP_QUOTA_NEED_FSCK_FLAG)) {
                        write_checkpoints(sbi);
                }
+               /* to return FSCK_ERROR_CORRECTED */
+               ret =3D 0;
        }
        return ret;
 }

> +	return FSCK_ERRORS_LEFT_UNCORRECTED;
>  }
>  =

>  static void do_dump(struct f2fs_sb_info *sbi)
> @@ -833,11 +839,15 @@ int main(int argc, char **argv)
>  	if (c.func !=3D DUMP && f2fs_devs_are_umounted() < 0) {
>  		if (errno =3D=3D EBUSY) {
>  			ret =3D -1;
> +			if (c.func =3D=3D FSCK)
> +				ret =3D FSCK_OPERATIONAL_ERROR;
>  			goto quick_err;
>  		}
>  		if (!c.ro || c.func =3D=3D DEFRAG) {
>  			MSG(0, "\tError: Not available on mounted device!\n");
>  			ret =3D -1;
> +			if (c.func =3D=3D FSCK)
> +				ret =3D FSCK_OPERATIONAL_ERROR;
>  			goto quick_err;
>  		}
>  =

> @@ -854,6 +864,8 @@ int main(int argc, char **argv)
>  	/* Get device */
>  	if (f2fs_get_device_info() < 0) {
>  		ret =3D -1;
> +		if (c.func =3D=3D FSCK)
> +			ret =3D FSCK_OPERATIONAL_ERROR;
>  		goto quick_err;
>  	}
>  =

> @@ -873,7 +885,7 @@ fsck_again:
>  =

>  	switch (c.func) {
>  	case FSCK:
> -		do_fsck(sbi);
> +		ret =3D do_fsck(sbi);
>  		break;
>  #ifdef WITH_DUMP
>  	case DUMP:
> @@ -935,8 +947,11 @@ retry:
>  		}
>  	}
>  	ret =3D f2fs_finalize_device();
> -	if (ret < 0)
> +	if (ret) {
> +		if (c.func =3D=3D FSCK)
> +			return FSCK_OPERATIONAL_ERROR;
>  		return ret;
> +	}
>  =

>  	printf("\nDone: %lf secs\n", (get_boottime_ns() - start) / 1000000000.0=
);
>  	return 0;
> -- =

> 2.26.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
