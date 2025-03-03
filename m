Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71249A4C92C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 18:21:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tp9UJ-0000db-3t;
	Mon, 03 Mar 2025 17:21:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1tp9UH-0000dQ-En
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 17:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wjkxaiSyRL9ZcFVhc6bCCWuuOovruY1yyjEK6a00FNo=; b=VxI6qhd7GnbbATEYjzMwAC0T2u
 ktT9eVksekt1gih2tHegwY+ltDCeU9T1OZfaAV0jWPn6w4/iYUIy8dzX6dimaFh87Cx6yO9firxp3
 r9PsQKiADLYsswOzvQUygxRBlAs19IDJER/kvxsPya5z3nh0yx2drHghuVL5b36C8ZSk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wjkxaiSyRL9ZcFVhc6bCCWuuOovruY1yyjEK6a00FNo=; b=a
 imQ6l+2sAjonSh3tdhVnnyMI86j8jvoQa+KsjStv6X+qkyPIInwGEIsQlgrLJFhATYFF74A0/z27x
 X2yBnxS2NSXT3OG/VDbfLMaaBx2GAeg3gz66sS970mK1/++41FVOEdLntqmo0+bH6tOKb381zIV+T
 z1V+UBmKoMrDlL8A=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tp9UC-0008QP-7Z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 17:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741022497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wjkxaiSyRL9ZcFVhc6bCCWuuOovruY1yyjEK6a00FNo=;
 b=gZqWg81oUx7LQ704UYA1mLNBuhDiJqgLECC7pBJny4vIXXyAuFzIsAbdQxIUf5axQrICLK
 s4pio35tcfbn+Q3nUyny70PVSnzwYqTlgaC/TwURZGtN+HQ9JTAFFVaTfHbbM1jDgTovOU
 UvjwO7TxmoGzOmYG3bM0cTgQLUcKMjo=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-p3WL0AMUPXKZd56POogQuw-1; Mon, 03 Mar 2025 12:21:31 -0500
X-MC-Unique: p3WL0AMUPXKZd56POogQuw-1
X-Mimecast-MFC-AGG-ID: p3WL0AMUPXKZd56POogQuw_1741022490
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-85ada86653aso145119939f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Mar 2025 09:21:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741022490; x=1741627290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wjkxaiSyRL9ZcFVhc6bCCWuuOovruY1yyjEK6a00FNo=;
 b=Ehm44M09CK2Vclj9GaK1W4/Wa/etaosyjwF9QyiJXbngCgH+/KhQcFne7oEbl8hKi8
 kK3LZKxMuZemtktEdVzuSaBu2v8FegILs40j1E+AicHoARKFvFfXceqpi7QsWkW2eTuR
 KG6R/Nvl3td5QKTA0N6InbKTVRdIss0Qvgo+7/TZsj2cFcCzYVTDoaU9L/ZSKEx2abK6
 G2x/lSM6kkqJ8tYyq06tDGigdHGCi/I/c+OyjFEAJAfR1w7evc5mJyrXJS+yLO3DzCxp
 EtpiklnqjQR9iiTwaO77m/2JZx/v6UrS73OiNkJzv0LVQCcOPpT4/0ejBoTldgoi6/cH
 0JZA==
X-Gm-Message-State: AOJu0YwQFuS8j2ZlnIbry9b4A0ABWDesx8bZWITphy2IQNVPO80sTGvs
 pGnSIl9Gzd0GANitJsG/VqsCMiVGnx31HheV4IjpyCABGLL+UOCXo6epjEWaJSBlSBfW1dI9J/d
 PbOdZJIdYD8S9GD/AHXsxVS+Dz/4Kwho3gsfv4d28ETWs8n2s2ltmRftbj1/9SeWPSR6wwx56+p
 UQnhPNVJ0q4X/cpvYWzi05nuYzFn1GmNuJ4bewddOarhx31Qc4Zqdvf1XRNw==
X-Gm-Gg: ASbGnctbwlXj+Zp2wZR+OdfAuawtqk6OZpgzL3FbqkiDYMPihGMQSlKJl3d1bvmMLf4
 XlZtQmribP3YyQ2sYqIuuYVB7T5KqrKIn3BPx9UTVe7YMcrwNkTCkM58xXoTsugitVDA3bs/bOV
 n6NlpwH+QQKp029xFA+e+77roLMXzJpvddUOBQ51Yo47CzlQm6PPUbUR8A/c4w7IhbJqjzR5OOM
 AA4v5lk75IKBeAAsCcOrxmksSbhF4rudHFbWqLS+ZLyBrRKqvx8XD7lAZvXXyBxEgv86wWMTAbN
 HZxsuqY8jMrXQVt0ZX5oahBxZL2ONJA=
X-Received: by 2002:a05:6602:3708:b0:85a:e19c:d101 with SMTP id
 ca18e2360f4ac-85ae19cd689mr397259539f.6.1741022490232; 
 Mon, 03 Mar 2025 09:21:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXOELLv1DJjnfGZi4jGSCSqi05CIWq2effcH/guTIma0YCbwFPx6zcoxu/nCRDpuJbwkC00g==
X-Received: by 2002:a05:6602:3708:b0:85a:e19c:d101 with SMTP id
 ca18e2360f4ac-85ae19cd689mr397256539f.6.1741022489911; 
 Mon, 03 Mar 2025 09:21:29 -0800 (PST)
Received: from fedora-rawhide.sandeen.net ([65.128.97.82])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-85add261b4csm49563939f.9.2025.03.03.09.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 09:21:29 -0800 (PST)
From: Eric Sandeen <sandeen@redhat.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  3 Mar 2025 11:12:10 -0600
Message-ID: <20250303172127.298602-1-sandeen@redhat.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MQLF2EuYE-spI7KNkh8ghkqoFArjhPhh0MFQHThB8Y4_1741022490
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  I have been struggling to get to a good series to convert
 f2fs to the new mount API. f2fs is more complex, because much of the option
 parsing assumes that the superblock has already been read from dis [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tp9UC-0008QP-7Z
Subject: [f2fs-dev] [PATCH 0/9] f2fs: first steps towards mount API
 conversion
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
Cc: jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I have been struggling to get to a good series to convert f2fs to the
new mount API. f2fs is more complex, because much of the option parsing
assumes that the superblock has already been read from disk, and uses
that to test various on-disk features, etc. All of those tests will need
to be moved to after parsing is complete, and this series is just a
start.

The first two patches in this series are incidental, just things I
noticed when working on this. They are not critical to the conversion,
but they may be desirable anyway.

The rest of the patches move towards removal of explicit references to
*sb in parse_options(), using *sbi instead. (The full conversion may use
a private context structure instead of *sbi, since the *sbi is rather
large.)

It's up to you if you want to merge these now or not, but I thought I'd
share the direction I was moving, to get some feedback about whether
this seems to make sense. Next steps would be moving more of the feature
checks to later in the mount process, after parsing is complete.

This has been tested with random combinations of valid and invalid mount
options, but it has not been tested with a wide range of on-disk
features. My testing did not turn up any differences in behavior.
(I also did explicit testing of direct mount syscalls with "lazytime" as
an option string, keeping in mind the earlier regression there.)

Thanks,
-Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
