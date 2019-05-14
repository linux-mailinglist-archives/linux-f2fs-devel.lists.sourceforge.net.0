Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B611C08B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 May 2019 04:21:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQN3r-0003uF-PJ; Tue, 14 May 2019 02:20:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guaneryu@gmail.com>) id 1hQN3r-0003u2-2Q
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 02:20:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pp9TXTB0i7hj2m3Uf4rQUkxh2ShQtY3xKqp9vjDgHDs=; b=REG9pdParpoNzKdh7cjFY0Lbay
 ZWnojP8IK0a0tVqGHz6WFBzEtog8oeqTkVvAi7LnsukZwkskhY2iZbbtchq5AXDa88l14wGvcFqPE
 FW+scodTtpXg6DC7kQU+8BqvfuCvNcTa727Wwu4KEq6oWVgwc5GpLP8dhgQYYPpw1+0w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pp9TXTB0i7hj2m3Uf4rQUkxh2ShQtY3xKqp9vjDgHDs=; b=LW/0xSXGw8EMZ+yxag7GX2dbZF
 jnfd49L4aIqzNjaeAlhsoFFuQ6mf7lsY2GTM4Xa/TepE5sxtKEUZA7oS6HhK0Nw2b1+mCuzzGKNrX
 waZZiDcQfmY4322wQA4CdnOILotOhuygY3qoYgt/aIN6uNLwPlDcu/P3GthfrNmp+644=;
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hQN3o-002qKG-NX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 02:20:59 +0000
Received: by mail-pl1-f196.google.com with SMTP id a5so7400578pls.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 May 2019 19:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Pp9TXTB0i7hj2m3Uf4rQUkxh2ShQtY3xKqp9vjDgHDs=;
 b=Wu8/9UnUV3BA0ooglD0X5JmYaJJMMIcCwUPyHk7B+9cnBhor18GeQjyVS7l+G46yTC
 EkB17R6cKF7yS+6/ViDrlfitxc71ygr9jvrBovyw49zMwILT+0fLSuxhklV02WKHrIBN
 0evuQ54yYLs6F0O49A6SEV2isT7DA96+1KgZa6zUPNqSXEU+oM2kAZG/PrZBxlDOpQTN
 ohxvPeMyKFJt6erPJ7DRcgsPJ/3nytbV8SNW7lF7Hiymhgi25E1CgGDwxuEgPtU6dFHA
 Sl+ai3dS7KxEvOmuQqaTBYQxZI0ibAsT5sP85pCRwqcc5sYYyl3KrI8PK1G5AJ/s19RB
 3QsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Pp9TXTB0i7hj2m3Uf4rQUkxh2ShQtY3xKqp9vjDgHDs=;
 b=oTYbck2YECst7mjkl3MI1k9KovKibqnQ69I39l5MH0z7R3BmLmfVM4Ap1YJsjZAWKh
 lxvjEGL4V6X2r3ZK1uDcmga1GuWDrKJ4Af5xOvIwXI6Pp3bgO2uE57uDbf8UjQn0ZN8u
 rPkmu3ZoUbbhi/7BVspkluDVZpq69MXsbzdKR8F5ZkO+rCG6YOqTscIvjycljKEbgT8h
 7gBqOqMtSElxvtRI8H9KYrFzDTsJ+TjggtmHT+M0j7Tl3gQJX6CsPu5CsGuryZea10SA
 Rwkw2WxU8defiNeAcJHQuN3CJNDhvhBeMiYEyaa2PsChwgyaDI3azXiv7dafotT/HBdG
 DZPQ==
X-Gm-Message-State: APjAAAU5GMAf05e6OeDwprzNT6/UKsQIN7E6UOF8R89X2u9TUbSq5YWL
 Z/gobUpzQMioJKIJp2dT1sHHEkc6vvg=
X-Google-Smtp-Source: APXvYqzTiSqTTWQ9PZy1goFbxVypnSrz9+OGYy+npJ5RJSjeNCmUsoAk2XeotQFaK3NlWIs3xt7b4w==
X-Received: by 2002:a17:902:7b8d:: with SMTP id
 w13mr34247471pll.252.1557800450807; 
 Mon, 13 May 2019 19:20:50 -0700 (PDT)
Received: from localhost ([128.199.137.77])
 by smtp.gmail.com with ESMTPSA id i15sm26994103pfj.167.2019.05.13.19.20.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 19:20:49 -0700 (PDT)
Date: Tue, 14 May 2019 10:20:44 +0800
From: Eryu Guan <guaneryu@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190514022044.GL15846@desktop>
References: <20190426204153.101861-1-ebiggers@kernel.org>
 <20190426204153.101861-5-ebiggers@kernel.org>
 <20190512122703.GJ15846@desktop>
 <20190513191204.GA142816@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513191204.GA142816@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (guaneryu[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: marc.info]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1hQN3o-002qKG-NX
Subject: Re: [f2fs-dev] [RFC PATCH 4/7] common/encrypt: add helper for
 ciphertext verification tests
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, May 13, 2019 at 12:12:05PM -0700, Eric Biggers wrote:
> Hi Eryu,
> 
> On Sun, May 12, 2019 at 08:27:03PM +0800, Eryu Guan wrote:
> > > +# Retrieve the filename stored on-disk for the given file.
> > > +# The name is printed to stdout in binary.
> > > +_get_on_disk_filename()
> > > +{
> > > +	local device=$1
> > > +	local inode=$2
> > > +	local dir_inode=$3
> > > +
> > > +	case $FSTYP in
> > > +	ext4)
> > > +		# Extract the filename from the debugfs output line like:
> > > +		#
> > > +		#  131075  100644 (1)      0      0       0 22-Apr-2019 16:54 \xa2\x85\xb0z\x13\xe9\x09\x86R\xed\xdc\xce\xad\x14d\x19
> > > +		#
> > > +		$DEBUGFS_PROG $device -R "ls -l -r <$dir_inode>" \
> > > +					2>>$seqres.full | perl -ne '
> > > +			next if not /^\s*'$inode'\s+/;
> > > +			s/.*?\d\d:\d\d //;
> > > +			chomp;
> > > +			s/\\x([[:xdigit:]]{2})/chr hex $1/eg;
> > > +			print;'
> > > +		;;
> > > +	f2fs)
> > > +		# Extract the filename from the dump.f2fs output line like:
> > > +		#
> > > +		#  i_name                        		[UpkzIPuts9by1oDmE+Ivfw]
> > > +		#
> > > +		# The name is base64-encoded, so we have to decode it here.
> > > +		#
> > > +		$DUMP_F2FS_PROG $device -i $inode | perl -ne '
> > > +			next if not /^i_name\s+\[([A-Za-z0-9+,]+)\]/;
> > > +			chomp $1;
> > > +			my @chars = split //, $1;
> > > +			my $ac = 0;
> > > +			my $bits = 0;
> > > +			my $table = join "", (A..Z, a..z, 0..9, "+", ",");
> > > +			foreach (@chars) {
> > > +				$ac += index($table, $_) << $bits;
> > > +				$bits += 6;
> > > +				if ($bits >= 8) {
> > > +					print chr($ac & 0xff);
> > > +					$ac >>= 8;
> > > +					$bits -= 8;
> > > +				}
> > > +			}
> > > +			if ($ac != 0) {
> > > +				print STDERR "Invalid base64-encoded string!\n";
> > > +			}'
> > > +		;;
> > > +	*)
> > > +		_notrun "_get_on_disk_filename() isn't implemented on $FSTYP"
> > 
> > And looks like this function has nothing to do with fs encryption, move it to
> > common/rc?
> 
> For ext4 that's true, but for f2fs the name is assumed to be base64-encoded,
> which f2fs-tools only does for encrypted filenames.  I'll update the comment to
> clarify that the function assumes the directory is encrypted.
> 
> > 
> > > +		;;
> > > +	esac
> > > +}
> > > +
> > > +# Require support for _get_on_disk_filename()
> > > +_require_get_on_disk_filename_support()
> > > +{
> > > +	echo "Checking for _get_on_disk_filename() support for $FSTYP" >> $seqres.full
> > > +	case $FSTYP in
> > > +	ext4)
> > > +		# Verify that the "ls -l -r" debugfs command is supported and
> > > +		# hex-encodes non-ASCII characters, rather than using an
> > > +		# ambiguous escaping method.  This requires the e2fsprogs patch
> > > +		# "debugfs: avoid ambiguity when printing filenames"
> > > +		# (https://marc.info/?l=linux-ext4&m=155596495624232&w=2).
> > > +		# TODO: once merged, list the minimum e2fsprogs version here.
> > > +		_require_command "$DEBUGFS_PROG" debugfs
> > > +		_scratch_mount
> > > +		touch $SCRATCH_MNT/$'\xc1'
> > > +		_scratch_unmount
> > > +		if ! $DEBUGFS_PROG $SCRATCH_DEV -R "ls -l -r /" 2>&1 \
> > > +			| tee -a $seqres.full | grep -E -q '\s+\\xc1\s*$'; then
> > > +			_notrun "debugfs (e2fsprogs) is too old; doesn't support showing unambiguous on-disk filenames"
> > > +		fi
> > > +		;;
> > > +	f2fs)
> > > +		# Verify that dump.f2fs shows encrypted filenames in full.  This
> > > +		# requires the patch "f2fs-tools: improve filename printing"
> > > +		# (https://sourceforge.net/p/linux-f2fs/mailman/message/36648641/).
> > > +		# TODO: once merged, list the minimum f2fs-tools version here.
> > > +
> > > +		_require_command "$DUMP_F2FS_PROG" dump.f2fs
> > > +		_require_command "$KEYCTL_PROG" keyctl
> > > +		_scratch_mount
> > > +		_new_session_keyring
> > > +
> > > +		local keydesc=$(_generate_encryption_key)
> > > +		local dir=$SCRATCH_MNT/test.${FUNCNAME[0]}
> > > +		local file=$dir/$(perl -e 'print "A" x 255')
> > > +		mkdir $dir
> > > +		_set_encpolicy $dir $keydesc
> > > +		touch $file
> > > +		local inode=$(stat -c %i $file)
> > > +
> > > +		_scratch_unmount
> > > +		$KEYCTL_PROG clear @s
> > > +
> > > +		# 255-character filename should result in 340 base64 characters.
> > > +		if ! $DUMP_F2FS_PROG -i $inode $SCRATCH_DEV \
> > > +			| grep -E -q '^i_name[[:space:]]+\[[A-Za-z0-9+,]{340}\]'; then
> > > +			_notrun "dump.f2fs (f2fs-tools) is too old; doesn't support showing unambiguous on-disk filenames"
> > > +		fi
> > > +		;;
> > > +	*)
> > > +		_notrun "_get_on_disk_filename() isn't implemented on $FSTYP"
> > > +		;;
> > > +	esac
> > > +}
> > > +
> > > +# Get the file's list of on-disk blocks as a comma-separated list of block
> > > +# offsets from the start of the device.  "Blocks" are 512 bytes each here.
> > > +_get_file_block_list()
> > > +{
> > > +	local file=$1
> > > +
> > > +	sync
> > > +	$XFS_IO_PROG -c fiemap $file | perl -ne '
> > > +		next if not /^\s*\d+: \[\d+\.\.\d+\]: (\d+)\.\.(\d+)/;
> > > +		print $_ . "," foreach $1..$2;' | sed 's/,$//'
> > > +}
> > > +
> > > +# Dump a block list that was previously saved by _get_file_block_list().
> > > +_dump_file_blocks()
> > > +{
> > > +	local device=$1
> > > +	local blocklist=$2
> > > +	local block
> > > +
> > > +	for block in $(tr ',' ' ' <<< $blocklist); do
> > > +		dd if=$device bs=512 count=1 skip=$block status=none
> > > +	done
> > > +}
> > 
> > Above two functions seem generic enough to be moved to common/rc
> 
> I feel that would be premature because common/rc is kind of bloated, and there's
> a good chance these functions will only ever be used for encryption tests.
> Normally, xfstests only test for user-visible behavior, so tests just 'cat' the
> file contents, or 'ls' the filenames.  The encryption tests are somewhat special
> in that they really care about what's *actually* stored on-disk.
> 
> So I think that common/encrypt is the most logical location for now.  But I

Yeah, that makes sense to me. Perhaps the functions should be renamed to
reflect that they're encryption-related?

Thanks,
Eryu

> don't feel too strongly, and I can move it if you prefer.
> 
> Thanks for the review!
> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
