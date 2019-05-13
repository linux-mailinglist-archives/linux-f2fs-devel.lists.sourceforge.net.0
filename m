Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 936DE1BD9C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 May 2019 21:12:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQGMz-0005qg-9O; Mon, 13 May 2019 19:12:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hQGMx-0005qZ-VQ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 May 2019 19:12:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lVgf2CoKC0C9EFFQvECLs0Y7JQnEk4+mcL9iMWxUTAY=; b=NOrRmOKwZzVrjwxiw13pjeKMdv
 O6IbSh4peWatRe+SIcPEjeTe1EY87UZ5rk0dvJnfati2wiu6EJGMoqSei1Q/CpUsJ7ZOcfJzrH8P/
 FmUPgfBrU0lwlihNHTg/fTVyXmxrjlUrLDqpLNSf6AjfhbeTYGd9hg0V9axmDFnz7DGI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lVgf2CoKC0C9EFFQvECLs0Y7JQnEk4+mcL9iMWxUTAY=; b=j5OFlw06rok/xILbEPHZY8e/a2
 D5m5+ltGYrkXuJ8JrMjxs3/qr7ApDKXVoQ+IGcCTOxzKebKuuUXM3dO+uY2k3hOjP7EQShG2aYiI6
 ShaaL41heWKNFrq/IrwU/Mq5uhG9rWAjxSlqaI0jJl0vzkUtaRJYZWfIYq32DZHk7gbI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hQGMv-002Sxz-9q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 May 2019 19:12:15 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6CA61208C3;
 Mon, 13 May 2019 19:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557774727;
 bh=ELixTRGlJ2G2OWOG+eGZO1I+rdx28ZmdP7l5SUAl7Is=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tF8yQ63gnC5B0Mrjfy24phxpWv5rf1PxRDSZyBnUrBYjs6NLlU9MsNFqmVbFLQm6X
 kCAT1BaFYCQY/WqmUOUnDEqkuKby3Acc3E8Or26IX7r1tYUNCHS64mPoaTj8a8OkUR
 f3mMwO0wElYXIsoxY326syepp1yzZIIo+LFG6hf8=
Date: Mon, 13 May 2019 12:12:05 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Eryu Guan <guaneryu@gmail.com>
Message-ID: <20190513191204.GA142816@gmail.com>
References: <20190426204153.101861-1-ebiggers@kernel.org>
 <20190426204153.101861-5-ebiggers@kernel.org>
 <20190512122703.GJ15846@desktop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190512122703.GJ15846@desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 2.5 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 2.6 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hQGMv-002Sxz-9q
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

Hi Eryu,

On Sun, May 12, 2019 at 08:27:03PM +0800, Eryu Guan wrote:
> > +# Retrieve the filename stored on-disk for the given file.
> > +# The name is printed to stdout in binary.
> > +_get_on_disk_filename()
> > +{
> > +	local device=$1
> > +	local inode=$2
> > +	local dir_inode=$3
> > +
> > +	case $FSTYP in
> > +	ext4)
> > +		# Extract the filename from the debugfs output line like:
> > +		#
> > +		#  131075  100644 (1)      0      0       0 22-Apr-2019 16:54 \xa2\x85\xb0z\x13\xe9\x09\x86R\xed\xdc\xce\xad\x14d\x19
> > +		#
> > +		$DEBUGFS_PROG $device -R "ls -l -r <$dir_inode>" \
> > +					2>>$seqres.full | perl -ne '
> > +			next if not /^\s*'$inode'\s+/;
> > +			s/.*?\d\d:\d\d //;
> > +			chomp;
> > +			s/\\x([[:xdigit:]]{2})/chr hex $1/eg;
> > +			print;'
> > +		;;
> > +	f2fs)
> > +		# Extract the filename from the dump.f2fs output line like:
> > +		#
> > +		#  i_name                        		[UpkzIPuts9by1oDmE+Ivfw]
> > +		#
> > +		# The name is base64-encoded, so we have to decode it here.
> > +		#
> > +		$DUMP_F2FS_PROG $device -i $inode | perl -ne '
> > +			next if not /^i_name\s+\[([A-Za-z0-9+,]+)\]/;
> > +			chomp $1;
> > +			my @chars = split //, $1;
> > +			my $ac = 0;
> > +			my $bits = 0;
> > +			my $table = join "", (A..Z, a..z, 0..9, "+", ",");
> > +			foreach (@chars) {
> > +				$ac += index($table, $_) << $bits;
> > +				$bits += 6;
> > +				if ($bits >= 8) {
> > +					print chr($ac & 0xff);
> > +					$ac >>= 8;
> > +					$bits -= 8;
> > +				}
> > +			}
> > +			if ($ac != 0) {
> > +				print STDERR "Invalid base64-encoded string!\n";
> > +			}'
> > +		;;
> > +	*)
> > +		_notrun "_get_on_disk_filename() isn't implemented on $FSTYP"
> 
> And looks like this function has nothing to do with fs encryption, move it to
> common/rc?

For ext4 that's true, but for f2fs the name is assumed to be base64-encoded,
which f2fs-tools only does for encrypted filenames.  I'll update the comment to
clarify that the function assumes the directory is encrypted.

> 
> > +		;;
> > +	esac
> > +}
> > +
> > +# Require support for _get_on_disk_filename()
> > +_require_get_on_disk_filename_support()
> > +{
> > +	echo "Checking for _get_on_disk_filename() support for $FSTYP" >> $seqres.full
> > +	case $FSTYP in
> > +	ext4)
> > +		# Verify that the "ls -l -r" debugfs command is supported and
> > +		# hex-encodes non-ASCII characters, rather than using an
> > +		# ambiguous escaping method.  This requires the e2fsprogs patch
> > +		# "debugfs: avoid ambiguity when printing filenames"
> > +		# (https://marc.info/?l=linux-ext4&m=155596495624232&w=2).
> > +		# TODO: once merged, list the minimum e2fsprogs version here.
> > +		_require_command "$DEBUGFS_PROG" debugfs
> > +		_scratch_mount
> > +		touch $SCRATCH_MNT/$'\xc1'
> > +		_scratch_unmount
> > +		if ! $DEBUGFS_PROG $SCRATCH_DEV -R "ls -l -r /" 2>&1 \
> > +			| tee -a $seqres.full | grep -E -q '\s+\\xc1\s*$'; then
> > +			_notrun "debugfs (e2fsprogs) is too old; doesn't support showing unambiguous on-disk filenames"
> > +		fi
> > +		;;
> > +	f2fs)
> > +		# Verify that dump.f2fs shows encrypted filenames in full.  This
> > +		# requires the patch "f2fs-tools: improve filename printing"
> > +		# (https://sourceforge.net/p/linux-f2fs/mailman/message/36648641/).
> > +		# TODO: once merged, list the minimum f2fs-tools version here.
> > +
> > +		_require_command "$DUMP_F2FS_PROG" dump.f2fs
> > +		_require_command "$KEYCTL_PROG" keyctl
> > +		_scratch_mount
> > +		_new_session_keyring
> > +
> > +		local keydesc=$(_generate_encryption_key)
> > +		local dir=$SCRATCH_MNT/test.${FUNCNAME[0]}
> > +		local file=$dir/$(perl -e 'print "A" x 255')
> > +		mkdir $dir
> > +		_set_encpolicy $dir $keydesc
> > +		touch $file
> > +		local inode=$(stat -c %i $file)
> > +
> > +		_scratch_unmount
> > +		$KEYCTL_PROG clear @s
> > +
> > +		# 255-character filename should result in 340 base64 characters.
> > +		if ! $DUMP_F2FS_PROG -i $inode $SCRATCH_DEV \
> > +			| grep -E -q '^i_name[[:space:]]+\[[A-Za-z0-9+,]{340}\]'; then
> > +			_notrun "dump.f2fs (f2fs-tools) is too old; doesn't support showing unambiguous on-disk filenames"
> > +		fi
> > +		;;
> > +	*)
> > +		_notrun "_get_on_disk_filename() isn't implemented on $FSTYP"
> > +		;;
> > +	esac
> > +}
> > +
> > +# Get the file's list of on-disk blocks as a comma-separated list of block
> > +# offsets from the start of the device.  "Blocks" are 512 bytes each here.
> > +_get_file_block_list()
> > +{
> > +	local file=$1
> > +
> > +	sync
> > +	$XFS_IO_PROG -c fiemap $file | perl -ne '
> > +		next if not /^\s*\d+: \[\d+\.\.\d+\]: (\d+)\.\.(\d+)/;
> > +		print $_ . "," foreach $1..$2;' | sed 's/,$//'
> > +}
> > +
> > +# Dump a block list that was previously saved by _get_file_block_list().
> > +_dump_file_blocks()
> > +{
> > +	local device=$1
> > +	local blocklist=$2
> > +	local block
> > +
> > +	for block in $(tr ',' ' ' <<< $blocklist); do
> > +		dd if=$device bs=512 count=1 skip=$block status=none
> > +	done
> > +}
> 
> Above two functions seem generic enough to be moved to common/rc

I feel that would be premature because common/rc is kind of bloated, and there's
a good chance these functions will only ever be used for encryption tests.
Normally, xfstests only test for user-visible behavior, so tests just 'cat' the
file contents, or 'ls' the filenames.  The encryption tests are somewhat special
in that they really care about what's *actually* stored on-disk.

So I think that common/encrypt is the most logical location for now.  But I
don't feel too strongly, and I can move it if you prefer.

Thanks for the review!

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
