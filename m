Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA2D7CBA9E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Oct 2023 08:12:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qsdJX-0003NH-Qq;
	Tue, 17 Oct 2023 06:12:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1qsdJW-0003N6-Hj
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Oct 2023 06:12:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uVNo3e2jqLDSok7VxZ2csgFZJHEvyUH0i7SUrzYWQzw=; b=cJcagKxbk4kCV6uiAQQq4JwDFO
 vwX2YUFA0UBs6EvYo9ZAmxVYeYO6jir6tLSAbeUlQ6eAC/nMNXXlGI7hYBkER3xwp5sx0HzYGBUeB
 8ikAY++Z8dt9s3IiYUacdNIOqdkbjAWl1y+3MHqpIxG8C+ovTuOu6ITU9gs37R69jghw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uVNo3e2jqLDSok7VxZ2csgFZJHEvyUH0i7SUrzYWQzw=; b=JQm1J+V8zfEx9kehWkhuad1gkh
 7oFmZ3atIwfyhWPD8zxsThFMzmzR/J092IBszPzpea1PpTQIGbgDgovcf53qZ6bYYW5dHWqhVsPlc
 NJ2sjh4Tqblk4sU7L3OxM4/eYcRfB7f/MCSxkQzyQhvOxufRIPF/KOgStTXjKfP9YMP8=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qsdJQ-00HOA2-P0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Oct 2023 06:12:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uVNo3e2jqLDSok7VxZ2csgFZJHEvyUH0i7SUrzYWQzw=; b=G/8MMlC9GhkGCanSlYwLbU2rXu
 GJtod75SbNjbQgELtBRbKsLLMxjwNAWLoW0GWQjaGrmNn3uRJwUemISdJJe3DNcHEFfW3iryKEWOk
 wWTG6740X8KkVbQyjXGwNNCoNogPBBFn0kEj6t6nRSsGNEDZTnyHmqKKOHEV3uwuDP2c7Y5mp1FAb
 QcBI2Wtu+cyI1F9+YtAyzKo0+9HeYXLXvMcbTPO9wqLdFoS6wVZmAkBD7HQ+HOw57iUodc9FRTq7L
 VHO/r/udaKsKDwpYKE418WbxfcO27+ADxa1VwYyuR0LBqa7Y/otuRUTFGCkqdYJVlIriw53a8RdI7
 hWBLwyag==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qscyW-001x8d-2o; Tue, 17 Oct 2023 05:50:41 +0000
Date: Tue, 17 Oct 2023 06:50:40 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20231017055040.GN800259@ZenIV>
References: <20231011195620.GW800259@ZenIV> <20231011203412.GA85476@ZenIV>
 <CAHk-=wjSbompMCgMwR2-MB59QDB+OZ7Ohp878QoDc9o7z4pbNg@mail.gmail.com>
 <20231011215138.GX800259@ZenIV> <20231011230105.GA92231@ZenIV>
 <CAHfrynNbfPtAjY4Y7N0cyWyH35dyF_BcpfR58ASCCC7=-TfSFw@mail.gmail.com>
 <20231012050209.GY800259@ZenIV>
 <20231012103157.mmn6sv4e6hfrqkai@quack3>
 <20231012145758.yopnkhijksae5akp@quack3>
 <20231012191551.GZ800259@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012191551.GZ800259@ZenIV>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: [f2fs folks Cc'd] There's something very odd in f2fs_rename();
 this: f2fs_down_write(&F2FS_I(old_inode)->i_sem);
 if (!old_dir_entry || whiteout)
 file_lost_pino(old_inode); else /* adjust dir's i_pino to pass fsck chec
 [...] Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qsdJQ-00HOA2-P0
Subject: [f2fs-dev] [RFC] weirdness in f2fs_rename() with RENAME_WHITEOUT
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

[f2fs folks Cc'd]

	There's something very odd in f2fs_rename();
this:
        f2fs_down_write(&F2FS_I(old_inode)->i_sem);
        if (!old_dir_entry || whiteout)
                file_lost_pino(old_inode);
        else   
                /* adjust dir's i_pino to pass fsck check */
                f2fs_i_pino_write(old_inode, new_dir->i_ino);
        f2fs_up_write(&F2FS_I(old_inode)->i_sem);
and this:
                if (old_dir != new_dir && !whiteout)
                        f2fs_set_link(old_inode, old_dir_entry,
                                                old_dir_page, new_dir);
                else
                        f2fs_put_page(old_dir_page, 0);
The latter really stinks, especially considering
struct dentry *f2fs_get_parent(struct dentry *child)
{
        struct page *page;
        unsigned long ino = f2fs_inode_by_name(d_inode(child), &dotdot_name, &page);

        if (!ino) {
                if (IS_ERR(page))
                        return ERR_CAST(page);
                return ERR_PTR(-ENOENT);
        }
        return d_obtain_alias(f2fs_iget(child->d_sb, ino));
}

You want correct inumber in the ".." link.  And cross-directory
rename does move the source to new parent, even if you'd been asked
to leave a whiteout in the old place.

Why is that stuff conditional on whiteout?  AFAICS, that went into the
tree in the same commit that added RENAME_WHITEOUT support on f2fs,
mentioning "For now, we just try to follow the way that xfs/ext4 use"
in commit message.  But ext4 does *NOT* do anything of that sort -
at the time of that commit the relevant piece had been
        if (old.dir_bh) {
		retval = ext4_rename_dir_finish(handle, &old, new.dir->i_ino);
and old.dir_bh is set by
                retval = ext4_rename_dir_prepare(handle, &old);
a few lines prior, which is not conditional upon the whiteout.

What am I missing there?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
