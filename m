Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E40C8161735
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Feb 2020 17:13:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3j1D-00043l-4X; Mon, 17 Feb 2020 16:13:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1j3j1B-000438-20; Mon, 17 Feb 2020 16:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=79mrsdMpZPq81EcHssJU6sAclSp6O+HRgk1tiwv0Vl8=; b=Mbdh8M0dgUwox/dZqHCiXZGtRJ
 FADQiEzkeWrdetvxoo3FdcVtdUQHV2FrDwkRm+Cihs5ghFYCg7MKXT5F0svkOK5yUsv494kDxd3cI
 hyXlDzMpVl6z3JRztP/iRSqBIo25S+7rlhTZe3kCfgrZ/WqsT/I7uaQI49kqhtB27808=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=79mrsdMpZPq81EcHssJU6sAclSp6O+HRgk1tiwv0Vl8=; b=X
 JLhOuQcNZXyzaE6mZHt+hnkKIs8If7cBP/GoMCbNpk0F9LjNsoDNyRhO9/NYRhHv7sFuwZqCAXZn+
 V4Y1tyUuUnrSC5oVHLcfbAAlBqCDQucPO2UoJ4zO8ZEbpo7lyIM4RHR+4EgzumqzOnOZH1PNu38MQ
 4VbRubpD75jVqQJI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j3j19-006Jj8-P5; Mon, 17 Feb 2020 16:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=79mrsdMpZPq81EcHssJU6sAclSp6O+HRgk1tiwv0Vl8=; b=GMuzjHpYp20+IP116h8bDp0g41
 ttVv3QJJR7FUdGUEREIUbjI+FUFjDSURRen682to2IXcwuRloQMyivCGW0qj86X72Kvp1WppX4YSF
 KBNTZhQI4rrwMsNuFOEBTsFYSoyIjfuhXQtkFp51xA162kdPm79JVt9XIZ0172I/NqXRxeERVPF9L
 kLpRpq7LmR/RnnjrPy/y+l34kcRu6hNJOaGfDY1XqGzt5O0+3y1BFL1SEB5+/2nSR6nonL9n110Kx
 N4rWXQRqkj1rqfV3jAF6Ow+Wmr+s/DXyeHln9cn6x1qRSToaShgKICUy4iF4JXV3I10hB9VhSPmLY
 BoN4dDdw==;
Received: from ip-109-41-129-189.web.vodafone.de ([109.41.129.189]
 helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3j0c-0006ud-6y; Mon, 17 Feb 2020 16:12:34 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1j3j0Z-000fYx-H7; Mon, 17 Feb 2020 17:12:31 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Mon, 17 Feb 2020 17:11:46 +0100
Message-Id: <cover.1581955849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j3j19-006Jj8-P5
Subject: [f2fs-dev] [PATCH 00/44] Manually convert filesystem FS documents
 to ReST
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>, Jan Kara <jack@suse.cz>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Amir Goldstein <amir73il@gmail.com>, Bob Copeland <me@bobcopeland.com>,
 David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 linux-mtd@lists.infradead.org, Tyler Hicks <code@tyhicks.com>,
 linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 Naohiro Aota <naohiro.aota@wdc.com>, Christoph Hellwig <hch@infradead.org>,
 linux-nilfs@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Chris Mason <clm@fb.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 cluster-devel@redhat.com, v9fs-developer@lists.sourceforge.net,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 devel@lists.orangefs.org, ecryptfs@vger.kernel.org,
 Eric Van Hensbergen <ericvh@gmail.com>, Josef Bacik <josef@toxicpanda.com>,
 linux-fsdevel@vger.kernel.org, Joel Becker <jlbec@evilplan.org>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-ntfs-dev@lists.sourceforge.net, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 Jan Kara <jack@suse.com>, Bob Peterson <rpeterso@redhat.com>,
 Phillip Lougher <phillip@squashfs.org.uk>, Johannes Thumshirn <jth@kernel.org>,
 linux-erofs@lists.ozlabs.org, linux-karma-devel@lists.sourceforge.net,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There are lots of plain text documents under Documentation/filesystems.

Manually convert several of those to ReST and add them to the index file.

Mauro Carvalho Chehab (44):
  docs: filesystems: convert 9p.txt to ReST
  docs: filesystems: convert adfs.txt to ReST
  docs: filesystems: convert affs.txt to ReST
  docs: filesystems: convert afs.txt to ReST
  docs: filesystems: convert autofs-mount-control.txt to ReST
  docs: filesystems: convert befs.txt to ReST
  docs: filesystems: convert bfs.txt to ReST
  docs: filesystems: convert btrfs.txt to ReST
  docs: filesystems: convert ceph.txt to ReST
  docs: filesystems: convert cramfs.txt to ReST
  docs: filesystems: convert debugfs.txt to ReST
  docs: filesystems: convert dlmfs.txt to ReST
  docs: filesystems: convert ecryptfs.txt to ReST
  docs: filesystems: convert efivarfs.txt to ReST
  docs: filesystems: convert erofs.txt to ReST
  docs: filesystems: convert ext2.txt to ReST
  docs: filesystems: convert ext3.txt to ReST
  docs: filesystems: convert f2fs.txt to ReST
  docs: filesystems: convert gfs2.txt to ReST
  docs: filesystems: convert gfs2-uevents.txt to ReST
  docs: filesystems: convert hfsplus.txt to ReST
  docs: filesystems: convert hfs.txt to ReST
  docs: filesystems: convert hpfs.txt to ReST
  docs: filesystems: convert inotify.txt to ReST
  docs: filesystems: convert isofs.txt to ReST
  docs: filesystems: convert nilfs2.txt to ReST
  docs: filesystems: convert ntfs.txt to ReST
  docs: filesystems: convert ocfs2-online-filecheck.txt to ReST
  docs: filesystems: convert ocfs2.txt to ReST
  docs: filesystems: convert omfs.txt to ReST
  docs: filesystems: convert orangefs.txt to ReST
  docs: filesystems: convert proc.txt to ReST
  docs: filesystems: convert qnx6.txt to ReST
  docs: filesystems: convert ramfs-rootfs-initramfs.txt to ReST
  docs: filesystems: convert relay.txt to ReST
  docs: filesystems: convert romfs.txt to ReST
  docs: filesystems: convert squashfs.txt to ReST
  docs: filesystems: convert sysfs.txt to ReST
  docs: filesystems: convert sysv-fs.txt to ReST
  docs: filesystems: convert tmpfs.txt to ReST
  docs: filesystems: convert ubifs-authentication.rst.txt to ReST
  docs: filesystems: convert ubifs.txt to ReST
  docs: filesystems: convert udf.txt to ReST
  docs: filesystems: convert zonefs.txt to ReST

 Documentation/filesystems/{9p.txt => 9p.rst}  |  114 +-
 .../filesystems/{adfs.txt => adfs.rst}        |   29 +-
 .../filesystems/{affs.txt => affs.rst}        |   62 +-
 .../filesystems/{afs.txt => afs.rst}          |   73 +-
 ...t-control.txt => autofs-mount-control.rst} |  102 +-
 .../filesystems/{befs.txt => befs.rst}        |   59 +-
 .../filesystems/{bfs.txt => bfs.rst}          |   37 +-
 .../filesystems/{btrfs.txt => btrfs.rst}      |    3 +
 .../filesystems/{ceph.txt => ceph.rst}        |   26 +-
 .../filesystems/{cramfs.txt => cramfs.rst}    |   19 +-
 .../filesystems/{debugfs.txt => debugfs.rst}  |   54 +-
 .../filesystems/{dlmfs.txt => dlmfs.rst}      |   28 +-
 .../{ecryptfs.txt => ecryptfs.rst}            |   44 +-
 .../{efivarfs.txt => efivarfs.rst}            |    5 +-
 .../filesystems/{erofs.txt => erofs.rst}      |  175 +-
 .../filesystems/{ext2.txt => ext2.rst}        |   41 +-
 .../filesystems/{ext3.txt => ext3.rst}        |    2 +
 .../filesystems/{f2fs.txt => f2fs.rst}        |  252 +--
 .../{gfs2-uevents.txt => gfs2-uevents.rst}    |   20 +-
 .../filesystems/{gfs2.txt => gfs2.rst}        |   20 +-
 .../filesystems/{hfs.txt => hfs.rst}          |   23 +-
 .../filesystems/{hfsplus.txt => hfsplus.rst}  |    2 +
 .../filesystems/{hpfs.txt => hpfs.rst}        |  239 ++-
 Documentation/filesystems/index.rst           |   46 +-
 .../filesystems/{inotify.txt => inotify.rst}  |   33 +-
 Documentation/filesystems/isofs.rst           |   64 +
 Documentation/filesystems/isofs.txt           |   48 -
 .../filesystems/{nilfs2.txt => nilfs2.rst}    |   40 +-
 .../filesystems/{ntfs.txt => ntfs.rst}        |  143 +-
 ...lecheck.txt => ocfs2-online-filecheck.rst} |   45 +-
 .../filesystems/{ocfs2.txt => ocfs2.rst}      |   31 +-
 Documentation/filesystems/omfs.rst            |  112 ++
 Documentation/filesystems/omfs.txt            |  106 --
 .../{orangefs.txt => orangefs.rst}            |  187 +-
 .../filesystems/{proc.txt => proc.rst}        | 1498 +++++++++--------
 .../filesystems/{qnx6.txt => qnx6.rst}        |   22 +
 ...itramfs.txt => ramfs-rootfs-initramfs.rst} |   54 +-
 .../filesystems/{relay.txt => relay.rst}      |  129 +-
 .../filesystems/{romfs.txt => romfs.rst}      |   42 +-
 .../{squashfs.txt => squashfs.rst}            |   60 +-
 .../filesystems/{sysfs.txt => sysfs.rst}      |  324 ++--
 .../filesystems/{sysv-fs.txt => sysv-fs.rst}  |  155 +-
 .../filesystems/{tmpfs.txt => tmpfs.rst}      |   44 +-
 .../filesystems/ubifs-authentication.rst      |   10 +-
 .../filesystems/{ubifs.txt => ubifs.rst}      |   25 +-
 .../filesystems/{udf.txt => udf.rst}          |   21 +-
 .../filesystems/{zonefs.txt => zonefs.rst}    |  106 +-
 47 files changed, 2739 insertions(+), 2035 deletions(-)
 rename Documentation/filesystems/{9p.txt => 9p.rst} (63%)
 rename Documentation/filesystems/{adfs.txt => adfs.rst} (85%)
 rename Documentation/filesystems/{affs.txt => affs.rst} (86%)
 rename Documentation/filesystems/{afs.txt => afs.rst} (90%)
 rename Documentation/filesystems/{autofs-mount-control.txt => autofs-mount-control.rst} (89%)
 rename Documentation/filesystems/{befs.txt => befs.rst} (83%)
 rename Documentation/filesystems/{bfs.txt => bfs.rst} (71%)
 rename Documentation/filesystems/{btrfs.txt => btrfs.rst} (96%)
 rename Documentation/filesystems/{ceph.txt => ceph.rst} (91%)
 rename Documentation/filesystems/{cramfs.txt => cramfs.rst} (88%)
 rename Documentation/filesystems/{debugfs.txt => debugfs.rst} (91%)
 rename Documentation/filesystems/{dlmfs.txt => dlmfs.rst} (86%)
 rename Documentation/filesystems/{ecryptfs.txt => ecryptfs.rst} (70%)
 rename Documentation/filesystems/{efivarfs.txt => efivarfs.rst} (85%)
 rename Documentation/filesystems/{erofs.txt => erofs.rst} (54%)
 rename Documentation/filesystems/{ext2.txt => ext2.rst} (91%)
 rename Documentation/filesystems/{ext3.txt => ext3.rst} (88%)
 rename Documentation/filesystems/{f2fs.txt => f2fs.rst} (84%)
 rename Documentation/filesystems/{gfs2-uevents.txt => gfs2-uevents.rst} (94%)
 rename Documentation/filesystems/{gfs2.txt => gfs2.rst} (76%)
 rename Documentation/filesystems/{hfs.txt => hfs.rst} (80%)
 rename Documentation/filesystems/{hfsplus.txt => hfsplus.rst} (95%)
 rename Documentation/filesystems/{hpfs.txt => hpfs.rst} (66%)
 rename Documentation/filesystems/{inotify.txt => inotify.rst} (83%)
 create mode 100644 Documentation/filesystems/isofs.rst
 delete mode 100644 Documentation/filesystems/isofs.txt
 rename Documentation/filesystems/{nilfs2.txt => nilfs2.rst} (89%)
 rename Documentation/filesystems/{ntfs.txt => ntfs.rst} (85%)
 rename Documentation/filesystems/{ocfs2-online-filecheck.txt => ocfs2-online-filecheck.rst} (77%)
 rename Documentation/filesystems/{ocfs2.txt => ocfs2.rst} (88%)
 create mode 100644 Documentation/filesystems/omfs.rst
 delete mode 100644 Documentation/filesystems/omfs.txt
 rename Documentation/filesystems/{orangefs.txt => orangefs.rst} (83%)
 rename Documentation/filesystems/{proc.txt => proc.rst} (65%)
 rename Documentation/filesystems/{qnx6.txt => qnx6.rst} (98%)
 rename Documentation/filesystems/{ramfs-rootfs-initramfs.txt => ramfs-rootfs-initramfs.rst} (91%)
 rename Documentation/filesystems/{relay.txt => relay.rst} (91%)
 rename Documentation/filesystems/{romfs.txt => romfs.rst} (86%)
 rename Documentation/filesystems/{squashfs.txt => squashfs.rst} (91%)
 rename Documentation/filesystems/{sysfs.txt => sysfs.rst} (56%)
 rename Documentation/filesystems/{sysv-fs.txt => sysv-fs.rst} (73%)
 rename Documentation/filesystems/{tmpfs.txt => tmpfs.rst} (86%)
 rename Documentation/filesystems/{ubifs.txt => ubifs.rst} (91%)
 rename Documentation/filesystems/{udf.txt => udf.rst} (83%)
 rename Documentation/filesystems/{zonefs.txt => zonefs.rst} (90%)

-- 
2.24.1




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
