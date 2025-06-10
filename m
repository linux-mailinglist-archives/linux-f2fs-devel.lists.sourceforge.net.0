Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E35EAAD3D2B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:31:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCB5sCwTMm77RxKZwq3u7iCbtSD6JjBc9+DCCqitqK4=; b=g0t7fbcvf97Dc4WZoLC6l+VNhZ
	THmiFS5XVDy8axQO6aVS4Y49OjMdKZl+f3W3Afeu+ZB2l+AlvjsatMNS8jJ4mz8Ej9GOdfvEmBNiI
	fgtyN29+wi7zWVagLSLBYhmmVhtzSpmLjpkliNqcFSNRorxWrkRw2PWaowbech4lQpII=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0wo-0004fv-BW;
	Tue, 10 Jun 2025 15:31:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0wn-0004fp-36
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:31:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UgZP4biksOlKQrYyedMm+VAfl4FYZRtJpwc87dQde8U=; b=BgolOeaNg2IUQY+nxF+I/CwtX0
 8p+jWHS93cqRhbg/BtINEHWGEW9YaEaVE99ncQLos5Z7Lh8g2nc+jdatbLUy5OulpvfIWRgpKlmHO
 oxiaNYkjgQj4AQsBZCPhCTbHZIWpFbM0DbpiLh5aqCMko4sqCZzgg1wkUuJA6VAH9LK4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UgZP4biksOlKQrYyedMm+VAfl4FYZRtJpwc87dQde8U=; b=IgVHd8io/TpyfeFXRF90XCsm2K
 GhVajDL7krcBvz29zc+g+C9vdfubF1jmBUTqZMaSdiECQuWsFNPE0Wnn27l6++iVO/dLdJbwVFyhi
 AU6zYWUpfI4QyUdETX6LstevWOVIRksh5buFTES0y3RdP0IR72bSKmA1Ihyu0efKvlvI=;
Received: from mail-ot1-f41.google.com ([209.85.210.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0wm-0005GX-LP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:31:33 +0000
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-735ac221670so2974827a34.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749569482; x=1750174282; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UgZP4biksOlKQrYyedMm+VAfl4FYZRtJpwc87dQde8U=;
 b=hLi6wmO4VEEiixMovgg/dEuEaiTzZua48WxYT9RLdfQBGoec8bTNk0YxvtTdSjlYmY
 CuKr6vtkvGh0byy6N583quEJOUmmvWc7S6ksCsr4yo9uH5D78R8pwscnri/oxlWFIdZ4
 1l2D+n/vLLdoJB0x6pXl1JyRU7e0fUqOEJhKvxdpQxQexAuiOu+t6IshFwZkIBIisggU
 4xiNM39EnAc8RvwnbRcX5g7wQAmw3JN2swgzN6jgux5GR+7WoS1cAoUAPuoz9c2zMFo+
 dEbJE6HmSLwHW0Po7IC7DUxRtabIoPKOEnUQvIXlBKQuLdaJm6M4XagHl0TWGbgNqevM
 m5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749569482; x=1750174282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UgZP4biksOlKQrYyedMm+VAfl4FYZRtJpwc87dQde8U=;
 b=YPi/IV6v2esf3aeZOjUHs5GYGY3KFfAs5lJufb6rIsSKT0HAvGjV8XESW8Yoey7mc4
 OaD5tEAyZlXACSy6ex5IU6MgPivC7y36Qy2//b+f7g3lSUyd0DCOrpSst6nxyZ5zbCbT
 HBm5RAKEVOYsBQEgMtetQs4qfm0NxbXdcPV0k8CLXuY1ZKEj5CzawUB3PuNP+jpPVxz9
 wk84ry1KBMd6H5l6dWqrn/srFdIkV7qr5RGlLKzKBG5DDSceYgnEOtaQPMr6quw02Yp6
 RjWbt9jMp4bZ+7UsBsBv2ciZ2vqhJzLVpPBR49Z2G1aTqtzh9s6jNQnXHrLrl8XS8HkA
 TX0w==
X-Gm-Message-State: AOJu0YxURfiZXDVhcnWcRGw2puqhPGIQrd1v0J7DM53e/uCDOqJRby7y
 Sm+wzGqbm0+yG8mENBN5KGrghdyNoKcdOkK61bHNTpM279Qq2cMPHsftjw6oMQ==
X-Gm-Gg: ASbGncsE2BRbcVfzLNEw9T7EufkWwgM5RRB/sNHq0xqrxeU/N4pFtI4qZvYVv1qFVjQ
 X1+DAgoKFTtxyYVZv2646HdjG6CfWUDBF/blyzHW25QIu/nKQXGT5QGXHI1piaXG4uy8sbNWg0y
 AdLgC3PaNGaen6FfZigDDX43y6nDq+CXdu1fl6Y7ES6Mygjj/eNlGwJqlCCUbKgGncQDUhKwDwJ
 nd46/tf2bUtCC33oCvVjWmyMlb8vAZHCht/dOiUkYcV/X+d5/UE4kLcnoG9ovWc+dJ23fTTgv+b
 859eYKC2pTuLonRaV1i4090a1/7EV6R0xWOZoAO6uv78ctlCOt2LXAf4E0vFrMgM0PiJ
X-Google-Smtp-Source: AGHT+IHuXQ8m9Wts5djhgK3xKVv7X595pTzof1aI4qXemyn2BdVvjebaFqE7/EaTSQJn87cR6vXBqQ==
X-Received: by 2002:a05:6a00:18a8:b0:742:b9d2:dc8f with SMTP id
 d2e1a72fcca58-7485ea28be0mr3885687b3a.1.1749559135651; 
 Tue, 10 Jun 2025 05:38:55 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:55 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:37 +0800
Message-ID: <20250610123743.667183-28-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610123743.667183-1-shengyong1@xiaomi.com>
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong Signed-off-by: Sheng Yong ---
 tests/f_dentry_bad_hash/README
 | 8 +++++ tests/f_dentry_bad_hash/expect.in | 8 +++++
 tests/f_dentry_bad_hash/script
 | 56 +++++++++++++++++++++++++++++++ 3 files changed [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.41 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uP0wm-0005GX-LP
Subject: [f2fs-dev] [RFC PATCH v2 27/32] tests: add fsck testcase of fixing
 dentry hash code
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong1@xiaomi.com>

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 tests/f_dentry_bad_hash/README    |  8 +++++
 tests/f_dentry_bad_hash/expect.in |  8 +++++
 tests/f_dentry_bad_hash/script    | 56 +++++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 tests/f_dentry_bad_hash/README
 create mode 100644 tests/f_dentry_bad_hash/expect.in
 create mode 100644 tests/f_dentry_bad_hash/script

diff --git a/tests/f_dentry_bad_hash/README b/tests/f_dentry_bad_hash/README
new file mode 100644
index 000000000000..f36c44f7c7bd
--- /dev/null
+++ b/tests/f_dentry_bad_hash/README
@@ -0,0 +1,8 @@
+1. create f2fs image
+2. mount f2fs
+3. create an inline dentry directory, and create a file in it
+4. inject dentry's hash_code of the file
+5. fsck fixes the dentry's hash_code
+6. create a non-inline dentry directory (by converting), and create a file in it
+7. inject dentry's hash_code of the file
+8. fsck fixes the dentry's hash_code
diff --git a/tests/f_dentry_bad_hash/expect.in b/tests/f_dentry_bad_hash/expect.in
new file mode 100644
index 000000000000..074388fa6849
--- /dev/null
+++ b/tests/f_dentry_bad_hash/expect.in
@@ -0,0 +1,8 @@
+Info: Force to fix corruption
+[ASSERT] (f2fs_check_hash_code:x)  --> Mismatch hash_code for "testfile1" [12345:_HASH1_]
+[FIX] (f2fs_check_hash_code:x)  --> Fix hash_code for "testfile1" from 12345 to _HASH1_
+Info: Force to fix corruption
+Info: Force to fix corruption
+[ASSERT] (f2fs_check_hash_code:x)  --> Mismatch hash_code for "testfile2" [12345:_HASH2_]
+[FIX] (f2fs_check_hash_code:x)  --> Fix hash_code for "testfile2" from 12345 to _HASH2_
+Info: Force to fix corruption
diff --git a/tests/f_dentry_bad_hash/script b/tests/f_dentry_bad_hash/script
new file mode 100644
index 000000000000..4a2d31198e54
--- /dev/null
+++ b/tests/f_dentry_bad_hash/script
@@ -0,0 +1,56 @@
+#!/bin/bash
+
+DESC="dentry with invalid hash_code"
+
+. $TOPDIR/tests/helpers
+
+cleanup
+make_f2fs > $LOG
+
+mkdir $TESTDIR/mntdir
+# inject inline dentry
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG
+mkdir $TESTDIR/mntdir/testdir1
+touch $TESTDIR/mntdir/testdir1/testfile1
+ino=`stat -c "%i" $TESTDIR/mntdir/testdir1/testfile1`
+safe_umount $TESTDIR/mntdir >> $LOG
+
+hash_code=`$INJECT --dry-run --dent --nid $ino --mb d_hash $META | \
+	grep "Info: inject dentry d_hash of nid" | awk '{print $(NF-2)}'`
+echo "ino:$ino hash_code:$hash_code" >> $LOG
+
+$INJECT --dent --nid $ino --mb d_hash --val 0x12345 $META >> $LOG
+$FSCK $FSCK_OPTS -f $META > $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT
+cat $OUT >> $LOG
+skip_lines=`wc -l $OUT`
+
+HASH_CODE=`printf "%x" $hash_code`
+sed "s/_HASH1_/$HASH_CODE/g" $TESTDIR/expect.in > $TESTDIR/expect
+
+# inject non-inline dentry
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG
+mkdir $TESTDIR/mntdir/testdir2
+i=0
+while [ $i -lt 30 ]; do
+	touch $TESTDIR/mntdir/testdir2/loooooooooooooooooooooooooognametestfile$i
+	i=$((i + 1))
+done
+touch $TESTDIR/mntdir/testdir2/testfile2
+ino=`stat -c "%i" $TESTDIR/mntdir/testdir2/testfile2`
+safe_umount $TESTDIR/mntdir >> $LOG
+rm -rf $TESTDIR/mntdir
+
+hash_code=`$INJECT --dry-run --dent --nid $ino --mb d_hash $META | \
+	grep "Info: inject dentry d_hash of nid" | awk '{print $(NF-2)}'`
+echo "ino:$ino hash_code:$hash_code" >> $LOG
+
+$INJECT --dent --nid $ino --mb d_hash --val 0x12345 $META >> $LOG
+$FSCK $FSCK_OPTS -f $META >> $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT
+cat $OUT | tail -n +$skip_lines >> $LOG
+
+HASH_CODE=`printf "%x" $hash_code`
+sed -i "s/_HASH2_/$HASH_CODE/g" $TESTDIR/expect
+
+check_result
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
